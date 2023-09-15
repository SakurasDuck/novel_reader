// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:novel_reader/src/services/kv_store/kvstore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/novel.dart';
import '../models/novel_shelf_cache.dart';
import '../models/stream_done.dart';
import '../services/log/log.dart';
import 'chapter_reader.dart';

part 'novel_shelf_cache.g.dart';

const novel_shelf_key = "novel_shelf_key";

const novel_cache_key = "novel_cache_key";

@riverpod
Future<void> novel2Cache(Novel2CacheRef ref, Novel novel) async {
  final cacheKey = '$novel_cache_key${novel.novelId}';
  final novelStr = jsonEncode(novel.toJson());
  await kvStore.setString(cacheKey, novelStr);
  final result = await kvStore.getString(novel_shelf_key);
  if (result?.isNotEmpty != true) {
    final novelShelfCache = NovelShelfCache(novelCacheKey: [cacheKey]);
    await kvStore.setString(novel_shelf_key, jsonEncode(novelShelfCache));
  } else {
    final novelShelfCache = NovelShelfCache.fromJson(jsonDecode(result!));
    await kvStore.setString(
        novel_shelf_key,
        jsonEncode(NovelShelfCache(
            novelCacheKey: [...novelShelfCache.novelCacheKey, cacheKey])));
  }
}

Stream<Novel> _readNovel(List<String> novelCacheKey) {
  final futures = novelCacheKey.map((e) async {
    final novelStr = await kvStore.getString(e);
    final novel = Novel.fromJson(jsonDecode(novelStr!));
    return novel;
  });

  return Stream.fromFutures(futures);
}

@riverpod
Stream<Novel> getNovelsFromCache(GetNovelsFromCacheRef ref) async* {
  final result = await kvStore.getString(novel_shelf_key);
  if (result?.isNotEmpty != true) {
    yield* const Stream.empty();
    return;
  }

  await for (final item in _readNovel(
      NovelShelfCache.fromJson(jsonDecode(result!)).novelCacheKey)) {
    yield item;
  }
}

@riverpod
class NovelShelf extends _$NovelShelf {
  static Log get log => Log('NovelShelfProvier');

  @override
  List<Novel> build() => [];

  Future<void> loadRefresh() async {
    //这个异步为使清空state 导致重绘在initState,build中
    await Future.delayed(const Duration(milliseconds: 100));
    state = [];
    final listener =
        ref.read(getNovelsFromCacheProvider.stream).listen((event) {
      state = [...state, event];
    });
    await listener.asFuture();
  }

  @override
  bool updateShouldNotify(List<Novel> previous, List<Novel> next) =>
      previous != next || previous.length != next.length;
}

///查询小说的阅读进度
@riverpod
Future<List<ChapterScheduleCache?>> getChapterScheduleCaches(
    GetChapterScheduleCachesRef ref, List<Novel> novels) async {
  return Future.wait(novels.map(
      (e) => ref.read(getCurrentChapterScheduleProvider(e.novelId).future)));
}

@riverpod
class Schedules extends _$Schedules {
  @override
  List<ChapterScheduleCache> build() => [];

  void addAll(List<ChapterScheduleCache?> schedules) {
    state = [
      ...schedules
          .where((element) => element != null)
          .cast<ChapterScheduleCache>()
    ];
  }

  void relaceItem(ChapterScheduleCache schedule) {
    final index =
        state.indexWhere((element) => element.novelId == schedule.novelId);
    if (index != -1) {
      state[index] = schedule;
    }

    state = [...state];
  }
}
