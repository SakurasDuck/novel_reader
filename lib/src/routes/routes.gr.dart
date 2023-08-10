// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ChapterPreview.name: (routeData) {
      final args = routeData.argsAs<ChapterPreviewArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChapterPreviewView(
          novel: args.novel,
          chapter: args.chapter,
          key: args.key,
        ),
      );
    },
    ChaptersAcalyzer.name: (routeData) {
      final args = routeData.argsAs<ChaptersAcalyzerArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChaptersAcalyzerView(
          novel: args.novel,
          key: args.key,
        ),
      );
    },
    MyHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomeRouteArgs>(
          orElse: () => const MyHomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyHomePage(
          key: args.key,
          title: args.title,
        ),
      );
    },
  };
}

/// generated route for
/// [ChapterPreviewView]
class ChapterPreview extends PageRouteInfo<ChapterPreviewArgs> {
  ChapterPreview({
    required Novel novel,
    required NovelChapter chapter,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ChapterPreview.name,
          args: ChapterPreviewArgs(
            novel: novel,
            chapter: chapter,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ChapterPreview';

  static const PageInfo<ChapterPreviewArgs> page =
      PageInfo<ChapterPreviewArgs>(name);
}

class ChapterPreviewArgs {
  const ChapterPreviewArgs({
    required this.novel,
    required this.chapter,
    this.key,
  });

  final Novel novel;

  final NovelChapter chapter;

  final Key? key;

  @override
  String toString() {
    return 'ChapterPreviewArgs{novel: $novel, chapter: $chapter, key: $key}';
  }
}

/// generated route for
/// [ChaptersAcalyzerView]
class ChaptersAcalyzer extends PageRouteInfo<ChaptersAcalyzerArgs> {
  ChaptersAcalyzer({
    required Novel novel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ChaptersAcalyzer.name,
          args: ChaptersAcalyzerArgs(
            novel: novel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ChaptersAcalyzer';

  static const PageInfo<ChaptersAcalyzerArgs> page =
      PageInfo<ChaptersAcalyzerArgs>(name);
}

class ChaptersAcalyzerArgs {
  const ChaptersAcalyzerArgs({
    required this.novel,
    this.key,
  });

  final Novel novel;

  final Key? key;

  @override
  String toString() {
    return 'ChaptersAcalyzerArgs{novel: $novel, key: $key}';
  }
}

/// generated route for
/// [MyHomePage]
class MyHomeRoute extends PageRouteInfo<MyHomeRouteArgs> {
  MyHomeRoute({
    Key? key,
    String title = 'novel',
    List<PageRouteInfo>? children,
  }) : super(
          MyHomeRoute.name,
          args: MyHomeRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const PageInfo<MyHomeRouteArgs> page = PageInfo<MyHomeRouteArgs>(name);
}

class MyHomeRouteArgs {
  const MyHomeRouteArgs({
    this.key,
    this.title = 'novel',
  });

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'MyHomeRouteArgs{key: $key, title: $title}';
  }
}
