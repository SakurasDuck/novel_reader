// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'novel_directory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NovelChapter _$NovelChapterFromJson(Map<String, dynamic> json) {
  return _NovelChapter.fromJson(json);
}

/// @nodoc
mixin _$NovelChapter {
  String? get volume => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get startCharIndex => throw _privateConstructorUsedError;
  int? get endCharIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NovelChapterCopyWith<NovelChapter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NovelChapterCopyWith<$Res> {
  factory $NovelChapterCopyWith(
          NovelChapter value, $Res Function(NovelChapter) then) =
      _$NovelChapterCopyWithImpl<$Res, NovelChapter>;
  @useResult
  $Res call(
      {String? volume, String title, int startCharIndex, int? endCharIndex});
}

/// @nodoc
class _$NovelChapterCopyWithImpl<$Res, $Val extends NovelChapter>
    implements $NovelChapterCopyWith<$Res> {
  _$NovelChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? volume = freezed,
    Object? title = null,
    Object? startCharIndex = null,
    Object? endCharIndex = freezed,
  }) {
    return _then(_value.copyWith(
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startCharIndex: null == startCharIndex
          ? _value.startCharIndex
          : startCharIndex // ignore: cast_nullable_to_non_nullable
              as int,
      endCharIndex: freezed == endCharIndex
          ? _value.endCharIndex
          : endCharIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NovelChapterCopyWith<$Res>
    implements $NovelChapterCopyWith<$Res> {
  factory _$$_NovelChapterCopyWith(
          _$_NovelChapter value, $Res Function(_$_NovelChapter) then) =
      __$$_NovelChapterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? volume, String title, int startCharIndex, int? endCharIndex});
}

/// @nodoc
class __$$_NovelChapterCopyWithImpl<$Res>
    extends _$NovelChapterCopyWithImpl<$Res, _$_NovelChapter>
    implements _$$_NovelChapterCopyWith<$Res> {
  __$$_NovelChapterCopyWithImpl(
      _$_NovelChapter _value, $Res Function(_$_NovelChapter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? volume = freezed,
    Object? title = null,
    Object? startCharIndex = null,
    Object? endCharIndex = freezed,
  }) {
    return _then(_$_NovelChapter(
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startCharIndex: null == startCharIndex
          ? _value.startCharIndex
          : startCharIndex // ignore: cast_nullable_to_non_nullable
              as int,
      endCharIndex: freezed == endCharIndex
          ? _value.endCharIndex
          : endCharIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NovelChapter implements _NovelChapter {
  const _$_NovelChapter(
      {this.volume,
      required this.title,
      required this.startCharIndex,
      this.endCharIndex});

  factory _$_NovelChapter.fromJson(Map<String, dynamic> json) =>
      _$$_NovelChapterFromJson(json);

  @override
  final String? volume;
  @override
  final String title;
  @override
  final int startCharIndex;
  @override
  final int? endCharIndex;

  @override
  String toString() {
    return 'NovelChapter(volume: $volume, title: $title, startCharIndex: $startCharIndex, endCharIndex: $endCharIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NovelChapter &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startCharIndex, startCharIndex) ||
                other.startCharIndex == startCharIndex) &&
            (identical(other.endCharIndex, endCharIndex) ||
                other.endCharIndex == endCharIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, volume, title, startCharIndex, endCharIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NovelChapterCopyWith<_$_NovelChapter> get copyWith =>
      __$$_NovelChapterCopyWithImpl<_$_NovelChapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NovelChapterToJson(
      this,
    );
  }
}

abstract class _NovelChapter implements NovelChapter {
  const factory _NovelChapter(
      {final String? volume,
      required final String title,
      required final int startCharIndex,
      final int? endCharIndex}) = _$_NovelChapter;

  factory _NovelChapter.fromJson(Map<String, dynamic> json) =
      _$_NovelChapter.fromJson;

  @override
  String? get volume;
  @override
  String get title;
  @override
  int get startCharIndex;
  @override
  int? get endCharIndex;
  @override
  @JsonKey(ignore: true)
  _$$_NovelChapterCopyWith<_$_NovelChapter> get copyWith =>
      throw _privateConstructorUsedError;
}
