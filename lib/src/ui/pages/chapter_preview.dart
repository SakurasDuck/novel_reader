import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_reader/src/models/novel.dart';
import 'package:novel_reader/src/providers/chapter_preview.dart';

import '../../models/novel_directory.dart';

@RoutePage(name: 'ChapterPreview')
class ChapterPreviewView extends ConsumerWidget {
  const ChapterPreviewView(
      {required this.novel, required this.chapter, super.key});

  final Novel novel;

  final NovelChapter chapter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final content = ref.watch(readChapterContentProvider(novel, chapter));
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context,
                  bool innerBoxIsScrolled) =>
              <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    title: Text([
                      chapter.chapterIndex,
                      chapter.chapterTitle,
                    ].where((element) => element != null).join(' ')),
                  ),
                ),
              ],
          body: SingleChildScrollView(
            child: content.when(
            data: (data) => Text(data),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (err, stack) => Center(
              child: Text(err.toString()),
            ),
          ),
          )),
    );
  }
}
