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
    BookShelf.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookShelfView(),
      );
    },
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
      return AutoRoutePage<bool>(
        routeData: routeData,
        child: ChaptersAcalyzerView(
          novel: args.novel,
          key: args.key,
        ),
      );
    },
    NovelReader.name: (routeData) {
      final args = routeData.argsAs<NovelReaderArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReaderView(
          novel: args.novel,
          chapterIndex: args.chapterIndex,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [BookShelfView]
class BookShelf extends PageRouteInfo<void> {
  const BookShelf({List<PageRouteInfo>? children})
      : super(
          BookShelf.name,
          initialChildren: children,
        );

  static const String name = 'BookShelf';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [ReaderView]
class NovelReader extends PageRouteInfo<NovelReaderArgs> {
  NovelReader({
    required Novel novel,
    required int chapterIndex,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          NovelReader.name,
          args: NovelReaderArgs(
            novel: novel,
            chapterIndex: chapterIndex,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'NovelReader';

  static const PageInfo<NovelReaderArgs> page = PageInfo<NovelReaderArgs>(name);
}

class NovelReaderArgs {
  const NovelReaderArgs({
    required this.novel,
    required this.chapterIndex,
    this.key,
  });

  final Novel novel;

  final int chapterIndex;

  final Key? key;

  @override
  String toString() {
    return 'NovelReaderArgs{novel: $novel, chapterIndex: $chapterIndex, key: $key}';
  }
}
