// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novel_shelf_cache.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$novel2CacheHash() => r'1ab1b7e09edc71bcda6c46fbcbf77b867283d2f6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef Novel2CacheRef = AutoDisposeFutureProviderRef<void>;

/// See also [novel2Cache].
@ProviderFor(novel2Cache)
const novel2CacheProvider = Novel2CacheFamily();

/// See also [novel2Cache].
class Novel2CacheFamily extends Family<AsyncValue<void>> {
  /// See also [novel2Cache].
  const Novel2CacheFamily();

  /// See also [novel2Cache].
  Novel2CacheProvider call(
    Novel novel,
  ) {
    return Novel2CacheProvider(
      novel,
    );
  }

  @override
  Novel2CacheProvider getProviderOverride(
    covariant Novel2CacheProvider provider,
  ) {
    return call(
      provider.novel,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'novel2CacheProvider';
}

/// See also [novel2Cache].
class Novel2CacheProvider extends AutoDisposeFutureProvider<void> {
  /// See also [novel2Cache].
  Novel2CacheProvider(
    this.novel,
  ) : super.internal(
          (ref) => novel2Cache(
            ref,
            novel,
          ),
          from: novel2CacheProvider,
          name: r'novel2CacheProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$novel2CacheHash,
          dependencies: Novel2CacheFamily._dependencies,
          allTransitiveDependencies:
              Novel2CacheFamily._allTransitiveDependencies,
        );

  final Novel novel;

  @override
  bool operator ==(Object other) {
    return other is Novel2CacheProvider && other.novel == novel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, novel.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$getNovelsFromCacheHash() =>
    r'c065ed10a80bc1aa90574fc97138dc8fc6fef2fc';

/// See also [getNovelsFromCache].
@ProviderFor(getNovelsFromCache)
final getNovelsFromCacheProvider = AutoDisposeStreamProvider<Novel>.internal(
  getNovelsFromCache,
  name: r'getNovelsFromCacheProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getNovelsFromCacheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNovelsFromCacheRef = AutoDisposeStreamProviderRef<Novel>;
String _$getChapterScheduleCachesHash() =>
    r'938a2fcceaaacb5fb91e86bab620034a4b52a4a0';
typedef GetChapterScheduleCachesRef
    = AutoDisposeFutureProviderRef<List<ChapterScheduleCache?>>;

///查询小说的阅读进度
///
/// Copied from [getChapterScheduleCaches].
@ProviderFor(getChapterScheduleCaches)
const getChapterScheduleCachesProvider = GetChapterScheduleCachesFamily();

///查询小说的阅读进度
///
/// Copied from [getChapterScheduleCaches].
class GetChapterScheduleCachesFamily
    extends Family<AsyncValue<List<ChapterScheduleCache?>>> {
  ///查询小说的阅读进度
  ///
  /// Copied from [getChapterScheduleCaches].
  const GetChapterScheduleCachesFamily();

  ///查询小说的阅读进度
  ///
  /// Copied from [getChapterScheduleCaches].
  GetChapterScheduleCachesProvider call(
    List<Novel> novels,
  ) {
    return GetChapterScheduleCachesProvider(
      novels,
    );
  }

  @override
  GetChapterScheduleCachesProvider getProviderOverride(
    covariant GetChapterScheduleCachesProvider provider,
  ) {
    return call(
      provider.novels,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getChapterScheduleCachesProvider';
}

///查询小说的阅读进度
///
/// Copied from [getChapterScheduleCaches].
class GetChapterScheduleCachesProvider
    extends AutoDisposeFutureProvider<List<ChapterScheduleCache?>> {
  ///查询小说的阅读进度
  ///
  /// Copied from [getChapterScheduleCaches].
  GetChapterScheduleCachesProvider(
    this.novels,
  ) : super.internal(
          (ref) => getChapterScheduleCaches(
            ref,
            novels,
          ),
          from: getChapterScheduleCachesProvider,
          name: r'getChapterScheduleCachesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getChapterScheduleCachesHash,
          dependencies: GetChapterScheduleCachesFamily._dependencies,
          allTransitiveDependencies:
              GetChapterScheduleCachesFamily._allTransitiveDependencies,
        );

  final List<Novel> novels;

  @override
  bool operator ==(Object other) {
    return other is GetChapterScheduleCachesProvider && other.novels == novels;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, novels.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$novelShelfHash() => r'd0802c15019f954f19a9b8380f357ca166007e71';

/// See also [NovelShelf].
@ProviderFor(NovelShelf)
final novelShelfProvider =
    AutoDisposeNotifierProvider<NovelShelf, List<Novel>>.internal(
  NovelShelf.new,
  name: r'novelShelfProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$novelShelfHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NovelShelf = AutoDisposeNotifier<List<Novel>>;
String _$schedulesHash() => r'f65e5d9a63d5febe799c25c0383a9569749ea080';

/// See also [Schedules].
@ProviderFor(Schedules)
final schedulesProvider =
    AutoDisposeNotifierProvider<Schedules, List<ChapterScheduleCache>>.internal(
  Schedules.new,
  name: r'schedulesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$schedulesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Schedules = AutoDisposeNotifier<List<ChapterScheduleCache>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
