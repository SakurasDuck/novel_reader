import 'package:get_it/get_it.dart';

import 'instances/console_log_provider.dart';
import 'interfaces/i_log.dart';
import 'interfaces/i_log_provider.dart';
import 'interfaces/log_level.dart';

void defaultLogProvier(){
  GetIt.instance.registerSingleton<List<ILogProvider>>([ConsoleLogProvider()]);
}

class Log implements ILog {
  static LogLevel _logLevel = LogLevel.Information; //全局级别
  static void setLogLevel(LogLevel logLevel) {
    _logLevel = logLevel;
  }

  Log(this._modelName, {List<ILogProvider>? logProviders}) {
    if (logProviders != null) {
      _logProviders = logProviders;
    } else {
      _logProviders = GetIt.instance.get<List<ILogProvider>>();
    }
  }

  late final List<ILogProvider> _logProviders;
  final String _modelName;

  void output(LogLevel logLevel, Object message,
      [Object? exception, StackTrace? stackTrace]) {
    final now = DateTime.now();
    for (var logProvider in _logProviders) {
      logProvider.output(now, _modelName, logLevel, message,
          stackTrace: stackTrace, exception: exception);
    }
  }

  @override
  bool isEnabled(LogLevel logLevel) {
    return logLevel.index >= _logLevel.index;
  }

  @override
  void log<TState>(LogLevel logLevel, Object message, [Object? exception]) {
    if (isEnabled(logLevel)) output(logLevel, message, exception);
  }

  @override
  void logCritical(Object message,
      [Object? exception, StackTrace? stackTrace]) {
    if (isEnabled(LogLevel.Critical)) {
      output(LogLevel.Critical, message, exception, stackTrace);
    }
  }

  @override
  void logDebug(Object message, [Object? exception]) {
    if (isEnabled(LogLevel.Debug)) output(LogLevel.Debug, message, exception);
  }

  @override
  void logError(Object message, [Object? exception, StackTrace? stackTrace]) {
    if (isEnabled(LogLevel.Error)) {
      output(LogLevel.Error, message, exception, stackTrace);
    }
  }

  @override
  void logInformation(Object message, [Object? exception]) {
    if (isEnabled(LogLevel.Information)) {
      output(LogLevel.Information, message, exception);
    }
  }

  @override
  void logTrace(Object message, [Object? exception]) {
    if (isEnabled(LogLevel.Trace)) output(LogLevel.Trace, message, exception);
  }

  @override
  void logWarning(Object message, [Object? exception]) {
    if (isEnabled(LogLevel.Warning)) {
      output(LogLevel.Warning, message, exception);
    }
  }

  @override
  void addILogProvider(ILogProvider provider) {
    _logProviders.add(provider);
  }
}
