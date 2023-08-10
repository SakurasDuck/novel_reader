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
  String get chapteLine => throw _privateConstructorUsedError;
  String? get volumeIndex => throw _privateConstructorUsedError;
  String? get volumeTitle => throw _privateConstructorUsedError;
  String? get chapterTitle => throw _privateConstructorUsedError;
  String get chapterIndex => throw _privateConstructorUsedError;
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
      {String chapteLine,
      String? volumeIndex,
      String? volumeTitle,
      String? chapterTitle,
      String chapterIndex,
      int startCharIndex,
      int? endCharIndex});
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
    Object? chapteLine = null,
    Object? volumeIndex = freezed,
    Object? volumeTitle = freezed,
    Object? chapterTitle = freezed,
    Object? chapterIndex = null,
    Object? startCharIndex = null,
    Object? endCharIndex = freezed,
  }) {
    return _then(_value.copyWith(
      chapteLine: null == chapteLine
          ? _value.chapteLine
          : chapteLine // ignore: cast_nullable_to_non_nullable
              as String,
      volumeIndex: freezed == volumeIndex
          ? _value.volumeIndex
          : volumeIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      volumeTitle: freezed == volumeTitle
          ? _value.volumeTitle
          : volumeTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterTitle: freezed == chapterTitle
          ? _value.chapterTitle
          : chapterTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterIndex: null == chapterIndex
          ? _value.chapterIndex
          : chapterIndex // ignore: cast_nullable_to_non_nullable
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
      {String chapteLine,
      String? volumeIndex,
      String? volumeTitle,
      String? chapterTitle,
      String chapterIndex,
      int startCharIndex,
      int? endCharIndex});
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
    Object? chapteLine = null,
    Object? volumeIndex = freezed,
    Object? volumeTitle = freezed,
    Object? chapterTitle = freezed,
    Object? chapterIndex = null,
    Object? startCharIndex = null,
    Object? endCharIndex = freezed,
  }) {
    return _then(_$_NovelChapter(
      chapteLine: null == chapteLine
          ? _value.chapteLine
          : chapteLine // ignore: cast_nullable_to_non_nullable
              as String,
      volumeIndex: freezed == volumeIndex
          ? _value.volumeIndex
          : volumeIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      volumeTitle: freezed == volumeTitle
          ? _value.volumeTitle
          : volumeTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterTitle: freezed == chapterTitle
          ? _value.chapterTitle
          : chapterTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterIndex: null == chapterIndex
          ? _value.chapterIndex
          : chapterIndex // ignore: cast_nullable_to_non_nullable
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
      {required this.chapteLine,
      this.volumeIndex,
      this.volumeTitle,
      this.chapterTitle,
      required this.chapterIndex,
      required this.startCharIndex,
      this.endCharIndex});

  factory _$_NovelChapter.fromJson(Map<String, dynamic> json) =>
      _$$_NovelChapterFromJson(json);

  @override
  final String chapteLine;
  @override
  final String? volumeIndex;
  @override
  final String? volumeTitle;
  @override
  final String? chapterTitle;
  @override
  final String chapterIndex;
  @override
  final int startCharIndex;
  @override
  final int? endCharIndex;

  @override
  String toString() {
    return 'NovelChapter(chapteLine: $chapteLine, volumeIndex: $volumeIndex, volumeTitle: $volumeTitle, chapterTitle: $chapterTitle, chapterIndex: $chapterIndex, startCharIndex: $startCharIndex, endCharIndex: $endCharIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NovelChapter &&
            (identical(other.chapteLine, chapteLine) ||
                other.chapteLine == chapteLine) &&
            (identical(other.volumeIndex, volumeIndex) ||
                other.volumeIndex == volumeIndex) &&
            (identical(other.volumeTitle, volumeTitle) ||
                other.volumeTitle == volumeTitle) &&
            (identical(other.chapterTitle, chapterTitle) ||
                other.chapterTitle == chapterTitle) &&
            (identical(other.chapterIndex, chapterIndex) ||
                other.chapterIndex == chapterIndex) &&
            (identical(other.startCharIndex, startCharIndex) ||
                other.startCharIndex == startCharIndex) &&
            (identical(other.endCharIndex, endCharIndex) ||
                other.endCharIndex == endCharIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chapteLine, volumeIndex,
      volumeTitle, chapterTitle, chapterIndex, startCharIndex, endCharIndex);

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
      {required final String chapteLine,
      final String? volumeIndex,
      final String? volumeTitle,
      final String? chapterTitle,
      required final String chapterIndex,
      required final int startCharIndex,
      final int? endCharIndex}) = _$_NovelChapter;

  factory _NovelChapter.fromJson(Map<String, dynamic> json) =
      _$_NovelChapter.fromJson;

  @override
  String get chapteLine;
  @override
  String? get volumeIndex;
  @override
  String? get volumeTitle;
  @override
  String? get chapterTitle;
  @override
  String get chapterIndex;
  @override
  int get startCharIndex;
  @override
  int? get endCharIndex;
  @override
  @JsonKey(ignore: true)
  _$$_NovelChapterCopyWith<_$_NovelChapter> get copyWith =>
      throw _privateConstructorUsedError;
}
