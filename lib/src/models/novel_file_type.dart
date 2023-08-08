
// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

/// 小说文件类型
enum NovelFileType {
  @JsonValue(1)
  TXT,
  @JsonValue(2)
  CHM,
  @JsonValue(0)
  UNKNOW,

 
}

extension  NovelFileTypeExt on NovelFileType{
 static NovelFileType fromString(String fileType) {
  switch (fileType) {
    case 'txt':
      return NovelFileType.TXT;
    case 'chm':
      return NovelFileType.CHM;
    default:
      return NovelFileType.UNKNOW;
  }
}
}

