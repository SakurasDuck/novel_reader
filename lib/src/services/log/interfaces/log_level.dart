/// 日志输出级别，与后端C#保持一致,配置级别越高输出信息越少
/// [Trace] 密码等敏感信息,发行后不输出
/// [Debug] 调试信息，发行后不输出
/// [Information] 普通信息，默认值
/// [Warning] 警告
/// [Error] 错误
/// [Critical] 程序崩溃
/// [None] 不输出（只用于设置输出级别，不用于实际输出）
enum LogLevel {
  Trace,//密码等敏感信息,发行后不输出
  Debug,//调试信息，发行后不输出
  Information,//普通信息，默认值
  Warning,//警告
  Error,//错误
  Critical,//程序崩溃
  None  // 不输出（只用于设置输出级别，不用于实际输出）
}
