import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/helpers/default_error.dart';
import 'src/routes/routes.dart';
import 'src/services/log/log.dart';

void main() {
  runZonedGuarded(() {
    final WidgetsBinding widgetsBinding =
        WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    //同步错误
    FlutterError.onError = defaultError;
    // 日志输出provier
    defaultLogProvier();
    //默认日志等级
    Log.setLogLevel(LogLevel.Debug);

    runApp(const ProviderScope(child: MyApp()));
    Future.delayed(const Duration(seconds: 1), () {
      FlutterNativeSplash.remove();
    });
  }, (error, stack) {
    //异步错误
    defaultError(FlutterErrorDetails(exception: error, stack: stack));
  });
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: BotToastInit(),
      routerConfig: _appRouter.config(
          navigatorObservers: () => [BotToastNavigatorObserver()]),
      title: 'novel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

