import 'package:freezed_annotation/freezed_annotation.dart';

part 'novel_shelf_cache.g.dart';
part 'novel_shelf_cache.freezed.dart';

@freezed
class NovelShelfCache with _$NovelShelfCache {
  const factory NovelShelfCache({
    required List<String> novelCacheKey,
  }) = _NovelShelfCache;

  factory NovelShelfCache.fromJson(Map<String, dynamic> json) =>
      _$NovelShelfCacheFromJson(json);
}
