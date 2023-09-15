import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keframe/keframe.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:novel_reader/src/providers/chapter_reader.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

import '../../models/models.dart';
import '../../services/log/log.dart';
import '../components/custom_action_pop_button.dart';

extension ChapterTitleExt on Novel {
  String chapterTitle(int index) {
    return chapters?[index].chapterTitle ?? chapters?[index].chapterIndex ?? '';
  }
}

@RoutePage(name: 'NovelReader')
class ReaderView extends ConsumerWidget {
  const ReaderView({required this.novel, required this.schedule, super.key});

  static Log log = Log('ReaderView');

  final Novel novel;

  final ChapterScheduleCache schedule;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final centerKey = GlobalKey();
    final provider = chapterReaderProvider(novel, schedule);
    final readerState = ref.watch(provider);

    final currentIndexProvider =
        readerCurrentIndexProvider(schedule.chapterIndex);
    final currentIndex = ref.watch(currentIndexProvider);
    BuildContext? previousCtx;
    BuildContext? nextCtx;
    ChapterScheduleCache? currentSchedule;
    //获取当前ctx
    BuildContext currentCtx() {
      if (readerState.controller.controller?.hasClients != true) {
        return centerKey.currentContext!;
      }
      final currentOffset = readerState.controller.controller!.offset;
      if (currentOffset > 0) {
        return nextCtx!;
      } else {
        return previousCtx!;
      }
    }

    return WillPopScope(
        onWillPop: () async {
          // context.popRoute(currentSchedule);
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: PopAction(
              onPressed: () {
                context.popRoute(currentSchedule);
              },
            ),
            title: Text(novel.chapterTitle(currentIndex)),
          ),
          body: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
            if (notification is ScrollStartNotification) {
            } else if (notification is ScrollUpdateNotification) {
            } else if (notification is ScrollEndNotification) {
              log.logDebug('ScrollEndNotification');
              //滑动完成之后去触发sliver_observer,获取当前视图显示的item信息,去保存当前阅读的位置
              readerState.controller.dispatchOnceObserve(
                  sliverContext: currentCtx(), isForce: true);
            }
            return false;
          }, child: LayoutBuilder(
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
                    final currentOffset =
                        readerState.controller.controller!.offset;
                    if (currentOffset > 0) {
                      ///获取nexts index
                      if (next?.displayingChildIndexList.isNotEmpty == true) {
                        ref.read(currentIndexProvider.notifier).changeIndex(
                            schedule.chapterIndex +
                                next!.displayingChildIndexList.first);
                      } else {
                        //这里的处理是因为在滚动器 从负到正的时候 next.displayingChildIndexList会为空
                        // 使用dispatchOnceObserve来强制刷新
                        readerState.controller
                            .dispatchOnceObserve(
                                sliverContext: nextCtx!, isForce: true)
                            .then((value) {
                          if (next?.displayingChildIndexList.isNotEmpty ==
                              true) {
                            ref.read(currentIndexProvider.notifier).changeIndex(
                                schedule.chapterIndex +
                                    next!.displayingChildIndexList.first);
                          }
                        });
                      }
                    } else {
                      ///获取previous index
                      if (previous?.displayingChildIndexList.isNotEmpty ==
                          true) {
                        ref.read(currentIndexProvider.notifier).changeIndex(
                            schedule.chapterIndex -
                                previous!.displayingChildIndexList.last -
                                1);
                      }
                    }
                    //获取当前视图显示的item信息
                    if (currentOffset > 0) {
                      final viewportItem = next as ListViewObserveModel?;
                      if (viewportItem?.displayingChildModelList.isNotEmpty ==
                          true) {
                        final element =
                            viewportItem!.displayingChildModelList.first;
                        currentSchedule = ChapterScheduleCache(
                            novelId: novel.novelId,
                            chapterIndex: ref.read(currentIndexProvider),
                            chapterSchedule:
                                element.leadingMarginToViewport.abs());
                        ref.read(cacheCurrentChapterScheduleProvider(
                            currentSchedule!));
                      }
                    } else {
                      final viewportItem = previous as ListViewObserveModel?;
                      if (viewportItem?.displayingChildModelList.isNotEmpty ==
                          true) {
                        final element =
                            viewportItem!.displayingChildModelList.last;
                        currentSchedule = ChapterScheduleCache(
                            novelId: novel.novelId,
                            chapterIndex: ref.read(currentIndexProvider),
                            chapterSchedule:
                                element.leadingMarginToViewport.abs());
                        ref.read(cacheCurrentChapterScheduleProvider(
                            currentSchedule!));
                      }
                    }
                  },
                  child: SizeCacheWidget(
                    estimateCount: 2,
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
          )),
        ));
  }

  void onLifecycleEvent(LifecycleEvent event, int index) {
    log.logDebug('index:$index -onLifecycleEvent $event');
  }
}
