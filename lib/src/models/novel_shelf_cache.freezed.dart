// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'novel_shelf_cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NovelShelfCache _$NovelShelfCacheFromJson(Map<String, dynamic> json) {
  return _NovelShelfCache.fromJson(json);
}

/// @nodoc
mixin _$NovelShelfCache {
  List<String> get novelCacheKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NovelShelfCacheCopyWith<NovelShelfCache> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NovelShelfCacheCopyWith<$Res> {
  factory $NovelShelfCacheCopyWith(
          NovelShelfCache value, $Res Function(NovelShelfCache) then) =
      _$NovelShelfCacheCopyWithImpl<$Res, NovelShelfCache>;
  @useResult
  $Res call({List<String> novelCacheKey});
}

/// @nodoc
class _$NovelShelfCacheCopyWithImpl<$Res, $Val extends NovelShelfCache>
    implements $NovelShelfCacheCopyWith<$Res> {
  _$NovelShelfCacheCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? novelCacheKey = null,
  }) {
    return _then(_value.copyWith(
      novelCacheKey: null == novelCacheKey
          ? _value.novelCacheKey
          : novelCacheKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NovelShelfCacheCopyWith<$Res>
    implements $NovelShelfCacheCopyWith<$Res> {
  factory _$$_NovelShelfCacheCopyWith(
          _$_NovelShelfCache value, $Res Function(_$_NovelShelfCache) then) =
      __$$_NovelShelfCacheCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> novelCacheKey});
}

/// @nodoc
class __$$_NovelShelfCacheCopyWithImpl<$Res>
    extends _$NovelShelfCacheCopyWithImpl<$Res, _$_NovelShelfCache>
    implements _$$_NovelShelfCacheCopyWith<$Res> {
  __$$_NovelShelfCacheCopyWithImpl(
      _$_NovelShelfCache _value, $Res Function(_$_NovelShelfCache) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? novelCacheKey = null,
  }) {
    return _then(_$_NovelShelfCache(
      novelCacheKey: null == novelCacheKey
          ? _value._novelCacheKey
          : novelCacheKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NovelShelfCache implements _NovelShelfCache {
  const _$_NovelShelfCache({required final List<String> novelCacheKey})
      : _novelCacheKey = novelCacheKey;

  factory _$_NovelShelfCache.fromJson(Map<String, dynamic> json) =>
      _$$_NovelShelfCacheFromJson(json);

  final List<String> _novelCacheKey;
  @override
  List<String> get novelCacheKey {
    if (_novelCacheKey is EqualUnmodifiableListView) return _novelCacheKey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_novelCacheKey);
  }

  @override
  String toString() {
    return 'NovelShelfCache(novelCacheKey: $novelCacheKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NovelShelfCache &&
            const DeepCollectionEquality()
                .equals(other._novelCacheKey, _novelCacheKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_novelCacheKey));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NovelShelfCacheCopyWith<_$_NovelShelfCache> get copyWith =>
      __$$_NovelShelfCacheCopyWithImpl<_$_NovelShelfCache>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NovelShelfCacheToJson(
      this,
    );
  }
}

abstract class _NovelShelfCache implements NovelShelfCache {
  const factory _NovelShelfCache({required final List<String> novelCacheKey}) =
      _$_NovelShelfCache;

  factory _NovelShelfCache.fromJson(Map<String, dynamic> json) =
      _$_NovelShelfCache.fromJson;

  @override
  List<String> get novelCacheKey;
  @override
  @JsonKey(ignore: true)
  _$$_NovelShelfCacheCopyWith<_$_NovelShelfCache> get copyWith =>
      throw _privateConstructorUsedError;
}
