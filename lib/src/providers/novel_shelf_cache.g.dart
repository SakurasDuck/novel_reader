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
    r'acfa0ad584adc148793ca5fe8e27c816eea86e4c';

/// See also [getNovelsFromCache].
@ProviderFor(getNovelsFromCache)
final getNovelsFromCacheProvider =
    AutoDisposeStreamProvider<List<Novel>>.internal(
  getNovelsFromCache,
  name: r'getNovelsFromCacheProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getNovelsFromCacheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNovelsFromCacheRef = AutoDisposeStreamProviderRef<List<Novel>>;
String _$novelShelfHash() => r'5fe2dde33b25c65c56ec9f0af8f83955e38d392a';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
