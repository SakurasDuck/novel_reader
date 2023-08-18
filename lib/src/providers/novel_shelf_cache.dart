// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:novel_reader/src/helpers/lock.dart';
import 'package:novel_reader/src/services/kv_store/kvstore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/novel.dart';
import '../models/novel_shelf_cache.dart';
import '../services/log/log.dart';

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

@riverpod
Stream<List<Novel>> getNovelsFromCache(GetNovelsFromCacheRef ref) async* {
  final result = await kvStore.getString(novel_shelf_key);
  final novels = <Novel>[];
  if (result?.isNotEmpty != true) {
    yield novels;
  }
  Stream<Novel> readNovel(List<String> novelCacheKey) {
    final futures = novelCacheKey.map((e) async {
      final novelStr = await kvStore.getString(e);
      final novel = Novel.fromJson(jsonDecode(novelStr!));
      return novel;
    });

    return Stream.fromFutures(futures);
  }

  await for (final item in readNovel(
      NovelShelfCache.fromJson(jsonDecode(result!)).novelCacheKey)) {
    novels.add(item);
    yield novels;
  }
}

@riverpod
class NovelShelf extends _$NovelShelf {
  static Log get log => Log('NovelShelfProvier');

  @override
  List<Novel> build() => [];

  Future<void> loadRefresh() async {
    state = await ref.read(getNovelsFromCacheProvider.future);
  }

  @override
  bool updateShouldNotify(List<Novel> previous, List<Novel> next) =>
      previous != next || previous.length != next.length;
}
