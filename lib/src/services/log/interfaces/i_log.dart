
//日志输出接口


import 'i_log_provider.dart';
import 'log_level.dart';

abstract class ILog {
 /// 检查给定的 logLevel 是否启用。
 /// [logLevel] 日志级别.
 /// 返回结果: 如果启用，则为true。
  bool isEnabled(LogLevel logLevel);


  /// 添加日志收集者
  void addILogProvider(ILogProvider provider);
 /// 日志输入
 /// 参数:
 ///  [logLevel] 输出将写在这个日志级别上
 ///  [message] 日志信息
 ///  [exception] 抛出的异常
 ///  [formatter] Function to create a string message of the state and exception.
  void log<TState>(LogLevel logLevel,  Object message,[Object? exception]);

  /// 程序崩溃
  /// [message] 日志信息
  /// [exception] 抛出的异常
  void logCritical(Object message,[Object? exception,StackTrace? stackTrace]);

  /// 错误
  /// [message] 日志信息
  /// [exception] 抛出的异常
  void logError(Object message,[Object? exception,StackTrace? stackTrace]);

  /// 警告
  /// [message] 日志信息
  /// [exception] 抛出的异常
  void logWarning(Object message,[Object? exception]);

  /// 普通信息，默认值
  void logInformation(Object message,[Object? exception]);

  /// 调试信息，发行后不输出
  void logDebug(Object message,[Object? exception]);

  /// 密码等敏感信息,发行后不输出
  void logTrace(Object message,[Object? exception]);
}
