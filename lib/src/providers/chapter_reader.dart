import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:novel_reader/src/models/models.dart';
import 'package:novel_reader/src/services/file/io_reader.dart';
import 'package:novel_reader/src/services/kv_store/kvstore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

import '../helpers/lock.dart';
import '../services/log/log.dart';

part 'chapter_reader.g.dart';
part 'chapter_reader.freezed.dart';

@riverpod
class ChapterReader extends _$ChapterReader {
  static Log get log => Log('ChapterReader');

  static final Lock _readingLock = Lock();

  @override
  ChapterReaderState build(
    Novel novel,
    ChapterScheduleCache schedule,
  ) {
    final controller = ref.watch(getSliverObserverControllerProvider);

    //监听滚动
    controller.controller?.addListener(() {
      final offset = controller.controller!.offset;
      final maxScrollExtent = controller.controller!.position.maxScrollExtent;
      final minScrollExtent = controller.controller!.position.minScrollExtent;
      final viewportDimension =
          controller.controller!.position.viewportDimension;
      //预留一屏高,提前加载下一章
      if (offset + viewportDimension >= maxScrollExtent) {
        if (_readingLock.isUsing()) {
          return;
        } else {
          _readingLock.mutex(() => readNext());
        }
      }
      //滚动到顶部加载上一章
      if (offset - viewportDimension <= minScrollExtent) {
        if (_readingLock.isUsing()) {
          return;
        } else {
          _readingLock.mutex(() => readPrevious());
        }
      }
    });

    ref.onDispose(() {
      controller.controller?.dispose();
    });
    //加载内容
    load(int cuttentIndex) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        readChapterContent(cuttentIndex).then((value) {
          if (value == null) {
            return;
          }
          state = state.copyWith(
            maxIndex: cuttentIndex,
            nexts: [...state.nexts, value],
          );

          //一帧之后内容没有撑满一屏继续加载下一章
          if (controller.controller!.position.maxScrollExtent <=
              controller.controller!.position.viewportDimension) {
            load(cuttentIndex + 1);
          }else{
            //加载完成,滚到上次阅读位置
            controller.controller!.jumpTo(schedule.chapterSchedule);
          }
        });
      });
    }

    load(schedule.chapterIndex);

    //预先加载上一章(如果有的话)
    if (schedule.chapterIndex > 0) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        readChapterContent(schedule.chapterIndex - 1).then((value) {
          if (value == null) {
            return;
          }
          state = state.copyWith(
            minIndex: schedule.chapterIndex - 1,
            previous: [value],
          );
        });
      });
    }

    return ChapterReaderState(
        previous: [],
        nexts: [],
        maxIndex: schedule.chapterIndex,
        minIndex: schedule.chapterIndex,
        controller: controller);
  }

  @override
  bool updateShouldNotify(
      ChapterReaderState previous, ChapterReaderState next) {
    return previous.previous.length != next.previous.length ||
        previous.nexts.length != next.nexts.length;
  }

  Future<String?> readChapterContent(int chapterIndex) async {
    log.logDebug('current loading chapterIndex:$chapterIndex');

    if ((novel.chapters?.length ?? 0) <= chapterIndex) {
      return null;
    }

    final chapter = novel.chapters![chapterIndex];
    final content = await IOReader(novel)
        .readAsync(start: chapter.startCharIndex, end: chapter.endCharIndex);
    return content;
  }

  bool get moreNext => state.maxIndex < (novel.chapters?.length ?? 0) - 1;

  Future<void> readNext() async {
    if (moreNext) {
      final nextIndex = state.maxIndex + 1;
      final nextContent = await readChapterContent(nextIndex);
      state = state.copyWith(
        nexts: [...state.nexts, nextContent!],
        maxIndex: nextIndex,
      );
    }
  }

  bool get morePrevious => state.minIndex > 0;

  Future<void> readPrevious() async {
    if (morePrevious) {
      final previousIndex = state.minIndex - 1;
      final previousContent = await readChapterContent(previousIndex);
      state = state.copyWith(
        previous: [...state.previous, previousContent!],
        minIndex: previousIndex,
      );
    }
  }
}

//当前阅读章节
@riverpod
class ReaderCurrentIndex extends _$ReaderCurrentIndex {
  @override
  int build(int initIndex) {
    return initIndex;
  }

  void changeIndex(int index) {
    state = index;
  }
}

@Freezed(makeCollectionsUnmodifiable: false)
class ChapterReaderState with _$ChapterReaderState {
  const factory ChapterReaderState({
    required List<String> previous,
    required List<String> nexts,
    required int minIndex,
    required int maxIndex,
    required SliverObserverController controller,
  }) = _ChapterReaderState;
}

@riverpod
SliverObserverController getSliverObserverController(
    GetSliverObserverControllerRef ref) {
  return SliverObserverController(
      controller: ScrollController(
  ));
}

//当前阅读位置缓存
// ignore: constant_identifier_names
const _novel_chapter_cache_key = 'novel_chapter_cache_key';

Lock? _lock;

@freezed
class ChapterScheduleCache with _$ChapterScheduleCache {
  const factory ChapterScheduleCache(
      {required String novelId,
      required int chapterIndex,
      required double chapterSchedule}) = _ChapterScheduleCache;

  factory ChapterScheduleCache.fromJson(Map<String, dynamic> json) =>
      _$ChapterScheduleCacheFromJson(json);
}

//当前章节阅读进度缓存key
String getNovelChapterCacheKey(novelId) =>
    '${_novel_chapter_cache_key}_$novelId';

@riverpod
Future<void> cacheCurrentChapterSchedule(CacheCurrentChapterScheduleRef ref,
    ChapterScheduleCache schedule) async {
  _lock ??= Lock();
  await _lock!.mutex(() => kvStore.setString(
      getNovelChapterCacheKey(schedule.novelId),
      jsonEncode(schedule)));
}

@riverpod
Future<ChapterScheduleCache?> getCurrentChapterSchedule(
  GetCurrentChapterScheduleRef ref,
  String novelId,
) async {
  final data = await kvStore.getString(getNovelChapterCacheKey(novelId));
  if (data?.isNotEmpty == true) {
    return ChapterScheduleCache.fromJson(jsonDecode(data!));
  }
  return null;
}
