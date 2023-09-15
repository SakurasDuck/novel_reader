import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

import '../models/models.dart';
import '../providers/chapter_reader.dart';
import '../ui/pages/pages.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: BookShelf.page,
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
        AutoRoute(
          page: NovelReader.page,
          path: '/novel_reader',
        ),
      ];
}
