//日志实际输出接口

import 'log_level.dart';

/// 日志输出
/// [time] 日志输出时间
/// [modelName] 模块名字
/// [logLevel] 日志级别
/// [message] 日志信息
/// [exception] 抛出的异常
abstract class ILogProvider {
  void output(
      DateTime time, String modelName, LogLevel logLevel, Object message,
      {Object? exception, StackTrace? stackTrace});
}
