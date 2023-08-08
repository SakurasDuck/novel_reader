// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Novel _$$_NovelFromJson(Map<String, dynamic> json) => _$_Novel(
      novelId: json['novelId'] as String,
      novelName: json['novelName'] as String,
      filePath: json['filePath'] as String?,
      length: const Int64Converter().fromJson(json['length'] as List<int>),
      novelDirectories: (json['novelDirectories'] as List<dynamic>?)
          ?.map((e) => NovelChapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      novelFileType: $enumDecode(_$NovelFileTypeEnumMap, json['novelFileType']),
      bytes: (json['bytes'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_NovelToJson(_$_Novel instance) => <String, dynamic>{
      'novelId': instance.novelId,
      'novelName': instance.novelName,
      'filePath': instance.filePath,
      'length': const Int64Converter().toJson(instance.length),
      'novelDirectories': instance.novelDirectories,
      'novelFileType': _$NovelFileTypeEnumMap[instance.novelFileType]!,
      'bytes': instance.bytes,
    };

const _$NovelFileTypeEnumMap = {
  NovelFileType.TXT: 1,
  NovelFileType.CHM: 2,
  NovelFileType.UNKNOW: 0,
};
