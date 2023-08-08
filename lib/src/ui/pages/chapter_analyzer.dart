import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_reader/src/models/novel.dart';
import 'package:novel_reader/src/providers/gen_novel_directory.dart';

import '../../models/novel_directory.dart';
import '../../services/log/log.dart';

class ChapterAcalyzerView extends ConsumerWidget {
  const ChapterAcalyzerView({required this.novel, super.key});

  final Novel novel;

  static Log get log => Log('ChapterAcalyzerView');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<NovelChapter>> novelValue =
        ref.watch(genNovelDirectoriesProvider(novel: novel));
    return Scaffold(
      appBar: AppBar(
        title: const Text('章节解析'),
      ),
      body: novelValue.when(
          data: (result) => ListView.builder(
                itemBuilder: (context, index) {
                  final NovelChapter chapter = result[index];
                  return ListTile(
                    title: Text(chapter.title),
                  );
                },
                itemCount: result.length,
              ),
          error: (error, stack) {
            log.logError(error, stack);
            return Center(
                child: Text(
              '出现错误',
              style: Theme.of(context).textTheme.labelMedium,
            ));
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
