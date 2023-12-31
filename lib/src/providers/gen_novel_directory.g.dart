// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gen_novel_directory.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$analyzeChaptersHash() => r'78b45e45f2bfc4ce1e099c98d40be989d6b34ae4';

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

typedef AnalyzeChaptersRef = AutoDisposeStreamProviderRef<List<NovelChapter>>;

/// See also [analyzeChapters].
@ProviderFor(analyzeChapters)
const analyzeChaptersProvider = AnalyzeChaptersFamily();

/// See also [analyzeChapters].
class AnalyzeChaptersFamily extends Family<AsyncValue<List<NovelChapter>>> {
  /// See also [analyzeChapters].
  const AnalyzeChaptersFamily();

  /// See also [analyzeChapters].
  AnalyzeChaptersProvider call({
    required Novel novel,
  }) {
    return AnalyzeChaptersProvider(
      novel: novel,
    );
  }

  @override
  AnalyzeChaptersProvider getProviderOverride(
    covariant AnalyzeChaptersProvider provider,
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
  String? get name => r'analyzeChaptersProvider';
}

/// See also [analyzeChapters].
class AnalyzeChaptersProvider
    extends AutoDisposeStreamProvider<List<NovelChapter>> {
  /// See also [analyzeChapters].
  AnalyzeChaptersProvider({
    required this.novel,
  }) : super.internal(
          (ref) => analyzeChapters(
            ref,
            novel: novel,
          ),
          from: analyzeChaptersProvider,
          name: r'analyzeChaptersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$analyzeChaptersHash,
          dependencies: AnalyzeChaptersFamily._dependencies,
          allTransitiveDependencies:
              AnalyzeChaptersFamily._allTransitiveDependencies,
        );

  final Novel novel;

  @override
  bool operator ==(Object other) {
    return other is AnalyzeChaptersProvider && other.novel == novel;
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
