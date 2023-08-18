import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'novel_directory.dart';
import 'novel_file_type.dart';

part 'novel.freezed.dart';
part 'novel.g.dart';

/// 小说模型
@freezed
class Novel with _$Novel {
  const factory Novel({
    required String novelId,
    required String novelName,
    String? filePath,
    required int length,
    List<NovelChapter>? chapters,
    required NovelFileType novelFileType,
    List<int>? bytes,
  }) = _Novel;

  factory Novel.fromJson(Map<String, dynamic> json) => _$NovelFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    if (kIsWeb) {
      return super.toJson()..remove('bytes');
    }
    return super.toJson();
  }
}
