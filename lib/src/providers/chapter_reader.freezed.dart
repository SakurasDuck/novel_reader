// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_reader.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChapterReaderState {
  List<String> get previous => throw _privateConstructorUsedError;
  List<String> get nexts => throw _privateConstructorUsedError;
  int get minIndex => throw _privateConstructorUsedError;
  int get maxIndex => throw _privateConstructorUsedError;
  SliverObserverController get controller => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChapterReaderStateCopyWith<ChapterReaderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterReaderStateCopyWith<$Res> {
  factory $ChapterReaderStateCopyWith(
          ChapterReaderState value, $Res Function(ChapterReaderState) then) =
      _$ChapterReaderStateCopyWithImpl<$Res, ChapterReaderState>;
  @useResult
  $Res call(
      {List<String> previous,
      List<String> nexts,
      int minIndex,
      int maxIndex,
      SliverObserverController controller});
}

/// @nodoc
class _$ChapterReaderStateCopyWithImpl<$Res, $Val extends ChapterReaderState>
    implements $ChapterReaderStateCopyWith<$Res> {
  _$ChapterReaderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previous = null,
    Object? nexts = null,
    Object? minIndex = null,
    Object? maxIndex = null,
    Object? controller = null,
  }) {
    return _then(_value.copyWith(
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nexts: null == nexts
          ? _value.nexts
          : nexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      minIndex: null == minIndex
          ? _value.minIndex
          : minIndex // ignore: cast_nullable_to_non_nullable
              as int,
      maxIndex: null == maxIndex
          ? _value.maxIndex
          : maxIndex // ignore: cast_nullable_to_non_nullable
              as int,
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as SliverObserverController,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChapterReaderStateCopyWith<$Res>
    implements $ChapterReaderStateCopyWith<$Res> {
  factory _$$_ChapterReaderStateCopyWith(_$_ChapterReaderState value,
          $Res Function(_$_ChapterReaderState) then) =
      __$$_ChapterReaderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> previous,
      List<String> nexts,
      int minIndex,
      int maxIndex,
      SliverObserverController controller});
}

/// @nodoc
class __$$_ChapterReaderStateCopyWithImpl<$Res>
    extends _$ChapterReaderStateCopyWithImpl<$Res, _$_ChapterReaderState>
    implements _$$_ChapterReaderStateCopyWith<$Res> {
  __$$_ChapterReaderStateCopyWithImpl(
      _$_ChapterReaderState _value, $Res Function(_$_ChapterReaderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previous = null,
    Object? nexts = null,
    Object? minIndex = null,
    Object? maxIndex = null,
    Object? controller = null,
  }) {
    return _then(_$_ChapterReaderState(
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nexts: null == nexts
          ? _value.nexts
          : nexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      minIndex: null == minIndex
          ? _value.minIndex
          : minIndex // ignore: cast_nullable_to_non_nullable
              as int,
      maxIndex: null == maxIndex
          ? _value.maxIndex
          : maxIndex // ignore: cast_nullable_to_non_nullable
              as int,
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as SliverObserverController,
    ));
  }
}

/// @nodoc

class _$_ChapterReaderState implements _ChapterReaderState {
  const _$_ChapterReaderState(
      {required this.previous,
      required this.nexts,
      required this.minIndex,
      required this.maxIndex,
      required this.controller});

  @override
  final List<String> previous;
  @override
  final List<String> nexts;
  @override
  final int minIndex;
  @override
  final int maxIndex;
  @override
  final SliverObserverController controller;

  @override
  String toString() {
    return 'ChapterReaderState(previous: $previous, nexts: $nexts, minIndex: $minIndex, maxIndex: $maxIndex, controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChapterReaderState &&
            const DeepCollectionEquality().equals(other.previous, previous) &&
            const DeepCollectionEquality().equals(other.nexts, nexts) &&
            (identical(other.minIndex, minIndex) ||
                other.minIndex == minIndex) &&
            (identical(other.maxIndex, maxIndex) ||
                other.maxIndex == maxIndex) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(previous),
      const DeepCollectionEquality().hash(nexts),
      minIndex,
      maxIndex,
      controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChapterReaderStateCopyWith<_$_ChapterReaderState> get copyWith =>
      __$$_ChapterReaderStateCopyWithImpl<_$_ChapterReaderState>(
          this, _$identity);
}

abstract class _ChapterReaderState implements ChapterReaderState {
  const factory _ChapterReaderState(
          {required final List<String> previous,
          required final List<String> nexts,
          required final int minIndex,
          required final int maxIndex,
          required final SliverObserverController controller}) =
      _$_ChapterReaderState;

  @override
  List<String> get previous;
  @override
  List<String> get nexts;
  @override
  int get minIndex;
  @override
  int get maxIndex;
  @override
  SliverObserverController get controller;
  @override
  @JsonKey(ignore: true)
  _$$_ChapterReaderStateCopyWith<_$_ChapterReaderState> get copyWith =>
      throw _privateConstructorUsedError;
}
