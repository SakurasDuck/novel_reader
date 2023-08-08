// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'novel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Novel _$NovelFromJson(Map<String, dynamic> json) {
  return _Novel.fromJson(json);
}

/// @nodoc
mixin _$Novel {
  String get novelId => throw _privateConstructorUsedError;
  String get novelName => throw _privateConstructorUsedError;
  String? get filePath => throw _privateConstructorUsedError;
  @Int64Converter()
  Int64 get length => throw _privateConstructorUsedError;
  List<NovelChapter>? get novelDirectories =>
      throw _privateConstructorUsedError;
  NovelFileType get novelFileType => throw _privateConstructorUsedError;
  List<int>? get bytes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NovelCopyWith<Novel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NovelCopyWith<$Res> {
  factory $NovelCopyWith(Novel value, $Res Function(Novel) then) =
      _$NovelCopyWithImpl<$Res, Novel>;
  @useResult
  $Res call(
      {String novelId,
      String novelName,
      String? filePath,
      @Int64Converter() Int64 length,
      List<NovelChapter>? novelDirectories,
      NovelFileType novelFileType,
      List<int>? bytes});
}

/// @nodoc
class _$NovelCopyWithImpl<$Res, $Val extends Novel>
    implements $NovelCopyWith<$Res> {
  _$NovelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? novelId = null,
    Object? novelName = null,
    Object? filePath = freezed,
    Object? length = null,
    Object? novelDirectories = freezed,
    Object? novelFileType = null,
    Object? bytes = freezed,
  }) {
    return _then(_value.copyWith(
      novelId: null == novelId
          ? _value.novelId
          : novelId // ignore: cast_nullable_to_non_nullable
              as String,
      novelName: null == novelName
          ? _value.novelName
          : novelName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as Int64,
      novelDirectories: freezed == novelDirectories
          ? _value.novelDirectories
          : novelDirectories // ignore: cast_nullable_to_non_nullable
              as List<NovelChapter>?,
      novelFileType: null == novelFileType
          ? _value.novelFileType
          : novelFileType // ignore: cast_nullable_to_non_nullable
              as NovelFileType,
      bytes: freezed == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NovelCopyWith<$Res> implements $NovelCopyWith<$Res> {
  factory _$$_NovelCopyWith(_$_Novel value, $Res Function(_$_Novel) then) =
      __$$_NovelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String novelId,
      String novelName,
      String? filePath,
      @Int64Converter() Int64 length,
      List<NovelChapter>? novelDirectories,
      NovelFileType novelFileType,
      List<int>? bytes});
}

/// @nodoc
class __$$_NovelCopyWithImpl<$Res> extends _$NovelCopyWithImpl<$Res, _$_Novel>
    implements _$$_NovelCopyWith<$Res> {
  __$$_NovelCopyWithImpl(_$_Novel _value, $Res Function(_$_Novel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? novelId = null,
    Object? novelName = null,
    Object? filePath = freezed,
    Object? length = null,
    Object? novelDirectories = freezed,
    Object? novelFileType = null,
    Object? bytes = freezed,
  }) {
    return _then(_$_Novel(
      novelId: null == novelId
          ? _value.novelId
          : novelId // ignore: cast_nullable_to_non_nullable
              as String,
      novelName: null == novelName
          ? _value.novelName
          : novelName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as Int64,
      novelDirectories: freezed == novelDirectories
          ? _value._novelDirectories
          : novelDirectories // ignore: cast_nullable_to_non_nullable
              as List<NovelChapter>?,
      novelFileType: null == novelFileType
          ? _value.novelFileType
          : novelFileType // ignore: cast_nullable_to_non_nullable
              as NovelFileType,
      bytes: freezed == bytes
          ? _value._bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Novel with DiagnosticableTreeMixin implements _Novel {
  const _$_Novel(
      {required this.novelId,
      required this.novelName,
      this.filePath,
      @Int64Converter() required this.length,
      final List<NovelChapter>? novelDirectories,
      required this.novelFileType,
      final List<int>? bytes})
      : _novelDirectories = novelDirectories,
        _bytes = bytes;

  factory _$_Novel.fromJson(Map<String, dynamic> json) =>
      _$$_NovelFromJson(json);

  @override
  final String novelId;
  @override
  final String novelName;
  @override
  final String? filePath;
  @override
  @Int64Converter()
  final Int64 length;
  final List<NovelChapter>? _novelDirectories;
  @override
  List<NovelChapter>? get novelDirectories {
    final value = _novelDirectories;
    if (value == null) return null;
    if (_novelDirectories is EqualUnmodifiableListView)
      return _novelDirectories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final NovelFileType novelFileType;
  final List<int>? _bytes;
  @override
  List<int>? get bytes {
    final value = _bytes;
    if (value == null) return null;
    if (_bytes is EqualUnmodifiableListView) return _bytes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Novel(novelId: $novelId, novelName: $novelName, filePath: $filePath, length: $length, novelDirectories: $novelDirectories, novelFileType: $novelFileType, bytes: $bytes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Novel'))
      ..add(DiagnosticsProperty('novelId', novelId))
      ..add(DiagnosticsProperty('novelName', novelName))
      ..add(DiagnosticsProperty('filePath', filePath))
      ..add(DiagnosticsProperty('length', length))
      ..add(DiagnosticsProperty('novelDirectories', novelDirectories))
      ..add(DiagnosticsProperty('novelFileType', novelFileType))
      ..add(DiagnosticsProperty('bytes', bytes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Novel &&
            (identical(other.novelId, novelId) || other.novelId == novelId) &&
            (identical(other.novelName, novelName) ||
                other.novelName == novelName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.length, length) || other.length == length) &&
            const DeepCollectionEquality()
                .equals(other._novelDirectories, _novelDirectories) &&
            (identical(other.novelFileType, novelFileType) ||
                other.novelFileType == novelFileType) &&
            const DeepCollectionEquality().equals(other._bytes, _bytes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      novelId,
      novelName,
      filePath,
      length,
      const DeepCollectionEquality().hash(_novelDirectories),
      novelFileType,
      const DeepCollectionEquality().hash(_bytes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NovelCopyWith<_$_Novel> get copyWith =>
      __$$_NovelCopyWithImpl<_$_Novel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NovelToJson(
      this,
    );
  }
}

abstract class _Novel implements Novel {
  const factory _Novel(
      {required final String novelId,
      required final String novelName,
      final String? filePath,
      @Int64Converter() required final Int64 length,
      final List<NovelChapter>? novelDirectories,
      required final NovelFileType novelFileType,
      final List<int>? bytes}) = _$_Novel;

  factory _Novel.fromJson(Map<String, dynamic> json) = _$_Novel.fromJson;

  @override
  String get novelId;
  @override
  String get novelName;
  @override
  String? get filePath;
  @override
  @Int64Converter()
  Int64 get length;
  @override
  List<NovelChapter>? get novelDirectories;
  @override
  NovelFileType get novelFileType;
  @override
  List<int>? get bytes;
  @override
  @JsonKey(ignore: true)
  _$$_NovelCopyWith<_$_Novel> get copyWith =>
      throw _privateConstructorUsedError;
}
