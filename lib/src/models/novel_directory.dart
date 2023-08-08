import 'package:freezed_annotation/freezed_annotation.dart';

part 'novel_directory.freezed.dart';
part 'novel_directory.g.dart';

/// 小说目录模型
@freezed
class NovelChapter with _$NovelChapter {
  const factory NovelChapter({
    String? volume,
    required String title,
    required int startCharIndex,
    int? endCharIndex,
  }) = _NovelChapter;

  factory NovelChapter.fromJson(Map<String, dynamic> json) =>
      _$NovelChapterFromJson(json);
}
