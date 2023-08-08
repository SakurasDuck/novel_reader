// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novel_directory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NovelChapter _$$_NovelChapterFromJson(Map<String, dynamic> json) =>
    _$_NovelChapter(
      volume: json['volume'] as String?,
      title: json['title'] as String,
      startCharIndex: json['startCharIndex'] as int,
      endCharIndex: json['endCharIndex'] as int?,
    );

Map<String, dynamic> _$$_NovelChapterToJson(_$_NovelChapter instance) =>
    <String, dynamic>{
      'volume': instance.volume,
      'title': instance.title,
      'startCharIndex': instance.startCharIndex,
      'endCharIndex': instance.endCharIndex,
    };
