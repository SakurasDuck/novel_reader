import 'package:flutter/cupertino.dart';

import 'global_log.dart';

void defaultError(FlutterErrorDetails details) {
  globalLog.logError('defaultError:', details.exception, details.stack);
}
