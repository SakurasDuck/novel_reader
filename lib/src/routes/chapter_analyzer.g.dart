// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_analyzer.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $chapterAcalyzerWithExtra,
    ];

RouteBase get $chapterAcalyzerWithExtra => GoRouteData.$route(
      path: '/chapter_analyzer',
      factory: $ChapterAcalyzerWithExtraExtension._fromState,
    );

extension $ChapterAcalyzerWithExtraExtension on ChapterAcalyzerWithExtra {
  static ChapterAcalyzerWithExtra _fromState(GoRouterState state) =>
      ChapterAcalyzerWithExtra(
        $extra: state.extra as Novel,
      );

  String get location => GoRouteData.$location(
        '/chapter_analyzer',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
