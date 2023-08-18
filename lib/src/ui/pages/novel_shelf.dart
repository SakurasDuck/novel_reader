import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_reader/src/providers/novel_shelf_cache.dart';
import 'package:novel_reader/src/providers/picker_file.dart';
import 'package:novel_reader/src/routes/routes.dart';
import 'package:novel_reader/src/ui/components/refresh.dart';

@RoutePage(name: 'BookShelf')
class BookShelfView extends ConsumerWidget {
  const BookShelfView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final novels = ref.watch(novelShelfProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('书架', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Refresh(
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: novels.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(novels[index].novelName),
                subtitle: Text(novels[index].length.toString()),
                onTap: () {
                  context.pushRoute(
                      NovelReader(novel: novels[index], chapterIndex: 3));
                },
              );
            },
          ),
          refreshFunc: () =>
              ref.watch(novelShelfProvider.notifier).loadRefresh()),
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
