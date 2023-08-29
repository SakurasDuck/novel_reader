import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keframe/keframe.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:novel_reader/src/providers/chapter_reader.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

import '../../models/models.dart';
import '../../services/log/log.dart';

extension ChapterTitleExt on Novel {
  String chapterTitle(int index) {
    return chapters?[index].chapterTitle ?? chapters?[index].chapterIndex ?? '';
  }
}

@RoutePage(name: 'NovelReader')
class ReaderView extends ConsumerWidget {
  const ReaderView(
      {required this.novel, required this.chapterIndex, super.key});

  static Log log = Log('ReaderView');

  final Novel novel;

  final int chapterIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final centerKey = GlobalKey();
    final provider = chapterReaderProvider(novel, chapterIndex);
    final readerState = ref.watch(provider);

    final currentIndexProvider = readerCurrentIndexProvider(chapterIndex);
    final currentIndex = ref.watch(currentIndexProvider);
    BuildContext? previousCtx;
    BuildContext? nextCtx;
    return Scaffold(
      appBar: AppBar(
        title: Text(novel.chapterTitle(currentIndex)),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SliverViewObserver(
              controller: readerState.controller,
              onObserveAll: (map) {
                if (readerState.controller.controller?.hasClients != true) {
                  return;
                }
                final previous = map[previousCtx];
                final next = map[nextCtx];
                //获取当前滚动器的位置
                final currentOffset = readerState.controller.controller!.offset;
                if (currentOffset > 0) {
                  ///获取nexts index
                  if (next?.displayingChildIndexList.isNotEmpty == true) {
                    ref.read(currentIndexProvider.notifier).changeIndex(
                        chapterIndex + next!.displayingChildIndexList.first);
                  } else {
                    //这里的处理是因为在滚动器 从负到正的时候 next.displayingChildIndexList会为空
                    // 使用dispatchOnceObserve来强制刷新
                    readerState.controller
                        .dispatchOnceObserve(
                            sliverContext: nextCtx!, isForce: true)
                        .then((value) {
                      if (next?.displayingChildIndexList.isNotEmpty == true) {
                        ref.read(currentIndexProvider.notifier).changeIndex(
                            chapterIndex +
                                next!.displayingChildIndexList.first);
                      }
                    });
                  }
                } else {
                  ///获取previous index
                  if (previous?.displayingChildIndexList.isNotEmpty == true) {
                    ref.read(currentIndexProvider.notifier).changeIndex(
                        chapterIndex -
                            previous!.displayingChildIndexList.last -
                            1);
                  }
                }
              },
              child: SizeCacheWidget(
                child: CustomScrollView(
                  controller: readerState.controller.controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  cacheExtent: constraints.maxHeight,
                  center: centerKey,
                  slivers: [
                    SliverList.builder(
                      itemBuilder: (context, index) {
                        previousCtx = context;
                        return FrameSeparateWidget(
                            index: index,
                            child: ScrollViewItemLifecycleWrapper(
                                onLifecycleEvent: (event) =>
                                    onLifecycleEvent(event, index),
                                child: Text(readerState.previous[index])));
                      },
                      itemCount: readerState.previous.length,
                    ),
                    SliverPadding(
                      key: centerKey,
                      padding: EdgeInsets.zero,
                    ),
                    SliverList.builder(
                      itemBuilder: (context, index) {
                        nextCtx = context;
                        return FrameSeparateWidget(
                            index: index,
                            child: ScrollViewItemLifecycleWrapper(
                                onLifecycleEvent: (event) =>
                                    onLifecycleEvent(event, index),
                                child: Text(readerState.nexts[index])));
                      },
                      itemCount: readerState.nexts.length,
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }

  void onLifecycleEvent(LifecycleEvent event, int index) {
    log.logDebug('index:$index -onLifecycleEvent $event');
  }
}
