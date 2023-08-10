import 'package:freezed_annotation/freezed_annotation.dart';

part 'novel_directory.freezed.dart';
part 'novel_directory.g.dart';

/// 小说目录模型
@freezed
class NovelChapter with _$NovelChapter {
  const factory NovelChapter({
    required String chapteLine,
    String? volumeIndex,
    String? volumeTitle,
    String? chapterTitle,
    required String chapterIndex,
    required int startCharIndex,
    int? endCharIndex,
  }) = _NovelChapter;

  factory NovelChapter.fromJson(Map<String, dynamic> json) =>
      _$NovelChapterFromJson(json);
}
