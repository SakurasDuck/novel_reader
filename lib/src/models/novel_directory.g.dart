// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novel_directory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NovelChapter _$$_NovelChapterFromJson(Map<String, dynamic> json) =>
    _$_NovelChapter(
      chapteLine: json['chapteLine'] as String,
      volumeIndex: json['volumeIndex'] as String?,
      volumeTitle: json['volumeTitle'] as String?,
      chapterTitle: json['chapterTitle'] as String?,
      chapterIndex: json['chapterIndex'] as String,
      startCharIndex: json['startCharIndex'] as int,
      endCharIndex: json['endCharIndex'] as int?,
    );

Map<String, dynamic> _$$_NovelChapterToJson(_$_NovelChapter instance) =>
    <String, dynamic>{
      'chapteLine': instance.chapteLine,
      'volumeIndex': instance.volumeIndex,
      'volumeTitle': instance.volumeTitle,
      'chapterTitle': instance.chapterTitle,
      'chapterIndex': instance.chapterIndex,
      'startCharIndex': instance.startCharIndex,
      'endCharIndex': instance.endCharIndex,
    };
