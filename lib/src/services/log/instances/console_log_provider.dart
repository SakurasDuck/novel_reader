//日志实际输出接口


import '../interfaces/i_log_provider.dart';
import '../interfaces/log_level.dart';

/// 控制台输出日志
class ConsoleLogProvider implements ILogProvider {
  @override
  void output(
      DateTime time, String modelName, LogLevel logLevel, Object message,
      {Object? exception, StackTrace? stackTrace}) {
    String log;
    if (stackTrace == null) {
      log = exception == null
          ? '${getLevelName(logLevel)}: ${time.toUtc().toString()} $modelName $message '
          : '${getLevelName(logLevel)}: ${time.toUtc().toString()} $modelName $message $exception ';
    } else {
      log = exception == null
          ? '${getLevelName(logLevel)}: ${time.toUtc().toString()} $modelName $message \nstack:$stackTrace'
          : '${getLevelName(logLevel)}: ${time.toUtc().toString()} $modelName $message $exception \nstack:$stackTrace';
    }

    // ignore: avoid_print
    print(log);
  }

  String getLevelName(LogLevel logLevel) {
    switch (logLevel) {
      case LogLevel.Trace:
        return 'trce';
      case LogLevel.Debug:
        return 'dbug';
      case LogLevel.Information:
        return 'info';
      case LogLevel.Warning:
        return 'warn';
      case LogLevel.Error:
        return 'fail';
      case LogLevel.Critical:
        return 'crit';
      case LogLevel.None:
        return 'none';
      default:
        return 'none';
    }
  }
}
