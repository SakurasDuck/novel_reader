import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_reader/src/providers/picker_file.dart';

import 'src/helpers/default_error.dart';
import 'src/routes/chapter_analyzer.dart';
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

    runApp(const ProviderScope(child: MyApp()));
    Future.delayed(const Duration(seconds: 1), () {
      FlutterNativeSplash.remove();
    });
  }, (error, stack) {
    //异步错误
    defaultError(FlutterErrorDetails(exception: error, stack: stack));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
                builder: (_, ref, __) => ElevatedButton(
                    onPressed: () async {
                      final result =
                          await ref.read(pickNovelFileProvider.future);
                      if (result != null) {
                        // ignore: use_build_context_synchronously
                        ChapterAcalyzerWithExtra($extra: result).go(context);
                      }
                    },
                    child: Text(
                      '选择文件',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ))),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
