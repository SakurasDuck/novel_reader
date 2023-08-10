import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

import '../models/models.dart';
import '../ui/pages/pages.dart';
import '../../main.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MyHomeRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: ChaptersAcalyzer.page,
          path: '/chapters_analyzer',
        ),
        AutoRoute(
            page: ChapterPreview.page,
            path: '/chapters_analyzer/chapter_preview'),
      ];
}
