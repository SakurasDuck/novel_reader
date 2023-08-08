import 'package:go_router/go_router.dart';

import '../../main.dart';
import 'chapter_analyzer.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) =>
        const MyHomePage(title: 'Flutter Demo Home Page'),
  ),
  $chapterAcalyzerWithExtra,
]);
