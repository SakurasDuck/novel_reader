import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_reader/src/providers/gen_novel_directory.dart';
import 'package:auto_route/auto_route.dart';
import 'package:novel_reader/src/routes/routes.dart';

import '../../models/novel.dart';
import '../../models/novel_directory.dart';
import '../../services/log/log.dart';

@RoutePage(name: 'ChaptersAcalyzer')
class ChaptersAcalyzerView extends ConsumerWidget {
  const ChaptersAcalyzerView({required this.novel, super.key});

  final Novel novel;

  static Log get log => Log('ChapterAcalyzerView');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final novelValue = ref.watch(analyzeChaptersProvider(novel: novel));
    return Scaffold(
      appBar: AppBar(
        title: const Text('章节解析'),
      ),
      body: novelValue.when(
          data: (result) {
            final positioned =
                result.any((element) => element.startCharIndex != -1);
            return Column(
              children: [
                if (positioned)
                  Container(
                    child: Row(
                      children: [
                        const Text(
                          '章节解析完成',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              '添加到书库',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  )
                else
                  Container(
                    child: const Text(
                      '正在分析章节,请稍等',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (context, index) {
                    final NovelChapter chapter = result[index];
                    return GestureDetector(
                      onTap: positioned
                          ? () {
                              //去预览
                              context.pushRoute(ChapterPreview(
                                  novel: novel, chapter: chapter));
                            }
                          : null,
                      child: ListTile(
                        title: Text([
                          chapter.volumeIndex,
                          chapter.volumeTitle,
                          chapter.chapterIndex,
                          chapter.chapterTitle,
                          chapter.startCharIndex,
                          chapter.endCharIndex
                        ].where((element) => element != null).join(' ')),
                      ),
                    );
                  },
                  itemCount: result.length,
                ))
              ],
            );
          },
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
