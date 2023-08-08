// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gen_novel_directory.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$genNovelDirectoriesHash() =>
    r'47a6fefb6d6ee0ee0cd5436993581f395a3a2098';

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

typedef GenNovelDirectoriesRef
    = AutoDisposeFutureProviderRef<List<NovelChapter>>;

/// See also [genNovelDirectories].
@ProviderFor(genNovelDirectories)
const genNovelDirectoriesProvider = GenNovelDirectoriesFamily();

/// See also [genNovelDirectories].
class GenNovelDirectoriesFamily extends Family<AsyncValue<List<NovelChapter>>> {
  /// See also [genNovelDirectories].
  const GenNovelDirectoriesFamily();

  /// See also [genNovelDirectories].
  GenNovelDirectoriesProvider call({
    required Novel novel,
  }) {
    return GenNovelDirectoriesProvider(
      novel: novel,
    );
  }

  @override
  GenNovelDirectoriesProvider getProviderOverride(
    covariant GenNovelDirectoriesProvider provider,
  ) {
    return call(
      novel: provider.novel,
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
  String? get name => r'genNovelDirectoriesProvider';
}

/// See also [genNovelDirectories].
class GenNovelDirectoriesProvider
    extends AutoDisposeFutureProvider<List<NovelChapter>> {
  /// See also [genNovelDirectories].
  GenNovelDirectoriesProvider({
    required this.novel,
  }) : super.internal(
          (ref) => genNovelDirectories(
            ref,
            novel: novel,
          ),
          from: genNovelDirectoriesProvider,
          name: r'genNovelDirectoriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$genNovelDirectoriesHash,
          dependencies: GenNovelDirectoriesFamily._dependencies,
          allTransitiveDependencies:
              GenNovelDirectoriesFamily._allTransitiveDependencies,
        );

  final Novel novel;

  @override
  bool operator ==(Object other) {
    return other is GenNovelDirectoriesProvider && other.novel == novel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, novel.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
