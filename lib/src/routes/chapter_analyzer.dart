import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/novel.dart';
import '../ui/pages/chapter_analyzer.dart';

part 'chapter_analyzer.g.dart';

@TypedGoRoute<ChapterAcalyzerWithExtra>(
  path: '/chapter_analyzer',
)
class ChapterAcalyzerWithExtra extends GoRouteData {
  const ChapterAcalyzerWithExtra({
    required this.$extra,
  });

  final Novel $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ChapterAcalyzerView(novel: $extra);
}
