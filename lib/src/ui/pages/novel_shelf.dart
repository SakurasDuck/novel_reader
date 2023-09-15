import 'package:auto_route/auto_route.dart';
import 'package:darq/darq.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_reader/src/providers/novel_shelf_cache.dart';
import 'package:novel_reader/src/providers/picker_file.dart';
import 'package:novel_reader/src/routes/routes.dart';
import 'package:novel_reader/src/ui/components/refresh.dart';

import '../../providers/chapter_reader.dart';

@RoutePage(name: 'BookShelf')
class BookShelfView extends ConsumerWidget {
  const BookShelfView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final novels = ref.watch(novelShelfProvider);
    final histories = ref.watch(schedulesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('书架', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Refresh(
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: novels.length,
            itemBuilder: (context, index) {
              //当前小说阅读进度
              final schedule = histories.firstWhereOrDefault(
                  (element) => element.novelId == novels[index].novelId,
                  defaultValue: null);
              return ListTile(
                title: Text(novels[index].novelName),
                subtitle: schedule == null
                    ? null
                    : Text(
                        '进度:${(schedule.chapterIndex / novels[index].chapters!.length * 100).toStringAsFixed(2)}%'),
                onTap: () {
                  context
                      .pushRoute<ChapterScheduleCache>(NovelReader(
                          novel: novels[index],
                          schedule: schedule ??
                              ChapterScheduleCache(
                                  novelId: novels[index].novelId,
                                  chapterIndex: 0,
                                  chapterSchedule: 0)))
                      .then((schedule) {
                    if (schedule != null) {
                      ref.read(schedulesProvider.notifier).relaceItem(schedule);
                    }
                  });
                },
              );
            },
          ),
          refreshFunc: () async {
            await ref.read(novelShelfProvider.notifier).loadRefresh();
            //读取阅读历史
            ref
                .read(getChapterScheduleCachesProvider(
                        ref.read(novelShelfProvider))
                    .future)
                .then((value) {
              ref.read(schedulesProvider.notifier).addAll(value);
            });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await ref.read(pickNovelFileProvider.future);
          if (result != null) {
            // ignore: use_build_context_synchronously
            context.pushRoute(ChaptersAcalyzer(novel: result));
          }
        },
        tooltip: '从文件中添加',
        child: const Icon(Icons.add),
      ),
    );
  }
}
