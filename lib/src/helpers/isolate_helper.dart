import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';

/// 持久化Isolate的创建和使用
/// 与compute用法类似,但compute用完即删除Isolate
/// 而IsolateHelper.compute可以在持久化Isolate中运行并得到一次结果
abstract class IsolateHelper {
  //创建并初始化一个Isolate
  static Future<IsolateCreateResult<TInitResult>>
      create<TInitParam, TInitResult, TComputeParam, TComputeResult>(
    ComputeCallback<TInitParam, TInitResult> initCallback,
    TInitParam initParam,
    ComputeCallback<TComputeParam, TComputeResult> computeCallback,
  ) async {
    //第1步: 默认执行环境下是rootIsolate，所以创建的是一个rootIsolateReceivePort
    final rootIsolateReceivePort = ReceivePort();
    //第2步: 获取rootIsolateSendPort
    final rootIsolateSendPort = rootIsolateReceivePort.sendPort;
    //第3步: 创建一个newIsolate实例，并把rootIsolateSendPort作为参数传入到newIsolate中，为的是让newIsolate中持有rootIsolateSendPort, 这样在newIsolate中就能向rootIsolate发送消息了
    final newIsolate = await Isolate.spawn<
        _IsolateConfiguration<TInitParam, TInitResult, TComputeParam,
            TComputeResult>>(
      _createNewIsolateContextThenRun,
      _IsolateConfiguration<TInitParam, TInitResult, TComputeParam,
          TComputeResult>(
        initCallback,
        initParam,
        computeCallback,
        rootIsolateSendPort,
      ),
      errorsAreFatal: true,
    );

    //第7步: 通过rootIsolateReceivePort接收到来自newIsolate的消息，所以可以注意到这里是await 因为是异步消息
    //只不过这个接收到的消息是newIsolateSendPort, 最后赋值给全局newIsolateSendPort，这样rootIsolate就持有newIsolate的SendPort
    final result = await rootIsolateReceivePort.first as List;
    return IsolateCreateResult<TInitResult>(
      //新线程
      newIsolate: newIsolate,
      //第8步: 建立连接后，在rootIsolate环境下就能向newIsolate发送消息了
      newIsolateSendPort: result[0],
      initResult: result[2], //实际的初始化结果
      initError: result[1], //是否有错误
    );
  }

  //将一个任务发送到通过create创建的Isolate执行,如果create时已经创建失败,本函数抛出异常
  static Future<TComputeResult> compute<TInitResult, TComputeParam, TComputeResult>(
      IsolateCreateResult<TInitResult> isolateCreateResult,
      TComputeParam message) async {
    if (isolateCreateResult.isError) {
      throw '不能对create失败的Isolate请求compute,initError:${isolateCreateResult.initError}';
    }

    final rootIsolateReceivePort =
        ReceivePort(); //创建专门应答消息rootIsolateReceivePort
    final rootIsolateSendPort = rootIsolateReceivePort.sendPort;
    isolateCreateResult.newIsolateSendPort.send([
      rootIsolateSendPort,
      message
    ]); //注意: 为了能接收到newIsolate回复消息需要带上rootIsolateSendPort
    //第11步: 监听来自newIsolate的消息
    final result = await rootIsolateReceivePort.first as List;
    final err = result[0];
    if (err != '') throw err; //将子线程的异常在主线程抛出
    return result[1];
  }

  //特别需要注意:本方法执行环境是newIsolate
  static void _createNewIsolateContextThenRun<TInitParam, TInitResult,
          TComputeParam, TComputeResult>(
      _IsolateConfiguration<TInitParam, TInitResult, TComputeParam, TComputeResult>
          configuration) async {
    //第4步: 注意callback这个函数执行环境就会变为newIsolate, 所以创建的是一个newIsolateReceivePort
    final newIsolateReceivePort = ReceivePort();
    //第5步: 获取newIsolateSendPort, 有人可能疑问这里为啥不是直接让全局newIsolateSendPort赋值，注意这里执行环境不是rootIsolate
    final newIsolateSendPort = newIsolateReceivePort.sendPort;

    //初始化实际的业务代码,可能会异常
    try {
      final initResult = await configuration.applyInit();
      //第6步: 特别需要注意这里，这里是利用rootIsolateSendPort向rootIsolate发送消息，只不过发送消息是newIsolate的SendPort, 这样rootIsolate就能拿到newIsolate的SendPort
      configuration.rootIsolateSendPort
          .send([newIsolateSendPort, '', initResult]);
    } catch (e) {
      //如果异常,将错误信息发回主线程,主线程将关闭子线程
      configuration.rootIsolateSendPort
          .send([newIsolateSendPort, e.toString(), null]);
      return;
    }

    //第9步: newIsolateReceivePort监听接收来自rootIsolate的消息
    newIsolateReceivePort.listen((message) async {
      final messageList = message as List;
      final messageSendPort = messageList[0] as SendPort;
      final computeParam = messageList[1] as TComputeParam;

      //执行实际的业务代码,可能会异常
      try {
        final result = await configuration.applyCompute(computeParam);

        //第10步: 收到消息后，立即向rootIsolate 发送一个回复消息
        messageSendPort.send(['', result]);
      } catch (e) {
        //如果异常,将错误信息发回主线程,主线程将关闭子线程
        messageSendPort.send([e.toString(), null]);
      }
    });
  }
}

//传递参数给线程的对象类
class _IsolateConfiguration<TInitParam, TInitResult, TComputeParam,
TComputeResult> {
  const _IsolateConfiguration(
    this.initCallback,
    this.initParam,
    this.computeCallback,
    this.rootIsolateSendPort,
  );

  final ComputeCallback<TInitParam, TInitResult> initCallback;
  final TInitParam initParam;
  final ComputeCallback<TComputeParam, TComputeResult> computeCallback;
  final SendPort rootIsolateSendPort;

  FutureOr<TInitResult> applyInit() => initCallback(initParam);

  FutureOr<TComputeResult> applyCompute(TComputeParam computeParam) =>
      computeCallback(computeParam);
}

class IsolateCreateResult<TInitResult> {
  //定义一个newIsolate
  Isolate newIsolate;

  //定义一个newIsolateSendPort, 该newIsolateSendPort需要让rootIsolate持有，
  //这样在rootIsolate中就能利用newIsolateSendPort向newIsolate发送消息
  SendPort newIsolateSendPort;

  //初始化后的结果,正常为非null
  TInitResult? initResult;

  //初始化的错误信息,''表示没有错误
  String initError;

  IsolateCreateResult(
      {required this.newIsolate,
      required this.newIsolateSendPort,
      required this.initResult,
      required this.initError});

  bool get isError => initError != '';
}
