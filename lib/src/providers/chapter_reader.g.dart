// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_reader.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSliverObserverControllerHash() =>
    r'8df9207e560b56cdcc6b11a37fcf8bce274f977d';

/// See also [getSliverObserverController].
@ProviderFor(getSliverObserverController)
final getSliverObserverControllerProvider =
    AutoDisposeProvider<SliverObserverController>.internal(
  getSliverObserverController,
  name: r'getSliverObserverControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSliverObserverControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSliverObserverControllerRef
    = AutoDisposeProviderRef<SliverObserverController>;
String _$chapterReaderHash() => r'bb50f58e21cd433171e25d64f6276588c993cfd7';

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

abstract class _$ChapterReader
    extends BuildlessAutoDisposeNotifier<ChapterReaderState> {
  late final Novel novel;
  late final int cuttentIndex;

  ChapterReaderState build(
    Novel novel,
    int cuttentIndex,
  );
}

/// See also [ChapterReader].
@ProviderFor(ChapterReader)
const chapterReaderProvider = ChapterReaderFamily();

/// See also [ChapterReader].
class ChapterReaderFamily extends Family<ChapterReaderState> {
  /// See also [ChapterReader].
  const ChapterReaderFamily();

  /// See also [ChapterReader].
  ChapterReaderProvider call(
    Novel novel,
    int cuttentIndex,
  ) {
    return ChapterReaderProvider(
      novel,
      cuttentIndex,
    );
  }

  @override
  ChapterReaderProvider getProviderOverride(
    covariant ChapterReaderProvider provider,
  ) {
    return call(
      provider.novel,
      provider.cuttentIndex,
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
  String? get name => r'chapterReaderProvider';
}

/// See also [ChapterReader].
class ChapterReaderProvider
    extends AutoDisposeNotifierProviderImpl<ChapterReader, ChapterReaderState> {
  /// See also [ChapterReader].
  ChapterReaderProvider(
    this.novel,
    this.cuttentIndex,
  ) : super.internal(
          () => ChapterReader()
            ..novel = novel
            ..cuttentIndex = cuttentIndex,
          from: chapterReaderProvider,
          name: r'chapterReaderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chapterReaderHash,
          dependencies: ChapterReaderFamily._dependencies,
          allTransitiveDependencies:
              ChapterReaderFamily._allTransitiveDependencies,
        );

  final Novel novel;
  final int cuttentIndex;

  @override
  bool operator ==(Object other) {
    return other is ChapterReaderProvider &&
        other.novel == novel &&
        other.cuttentIndex == cuttentIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, novel.hashCode);
    hash = _SystemHash.combine(hash, cuttentIndex.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  ChapterReaderState runNotifierBuild(
    covariant ChapterReader notifier,
  ) {
    return notifier.build(
      novel,
      cuttentIndex,
    );
  }
}

String _$readerCurrentIndexHash() =>
    r'34c3362e6746b8495fb730da72ab7af393a5afe8';

abstract class _$ReaderCurrentIndex extends BuildlessAutoDisposeNotifier<int> {
  late final int initIndex;

  int build(
    int initIndex,
  );
}

/// See also [ReaderCurrentIndex].
@ProviderFor(ReaderCurrentIndex)
const readerCurrentIndexProvider = ReaderCurrentIndexFamily();

/// See also [ReaderCurrentIndex].
class ReaderCurrentIndexFamily extends Family<int> {
  /// See also [ReaderCurrentIndex].
  const ReaderCurrentIndexFamily();

  /// See also [ReaderCurrentIndex].
  ReaderCurrentIndexProvider call(
    int initIndex,
  ) {
    return ReaderCurrentIndexProvider(
      initIndex,
    );
  }

  @override
  ReaderCurrentIndexProvider getProviderOverride(
    covariant ReaderCurrentIndexProvider provider,
  ) {
    return call(
      provider.initIndex,
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
  String? get name => r'readerCurrentIndexProvider';
}

/// See also [ReaderCurrentIndex].
class ReaderCurrentIndexProvider
    extends AutoDisposeNotifierProviderImpl<ReaderCurrentIndex, int> {
  /// See also [ReaderCurrentIndex].
  ReaderCurrentIndexProvider(
    this.initIndex,
  ) : super.internal(
          () => ReaderCurrentIndex()..initIndex = initIndex,
          from: readerCurrentIndexProvider,
          name: r'readerCurrentIndexProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$readerCurrentIndexHash,
          dependencies: ReaderCurrentIndexFamily._dependencies,
          allTransitiveDependencies:
              ReaderCurrentIndexFamily._allTransitiveDependencies,
        );

  final int initIndex;

  @override
  bool operator ==(Object other) {
    return other is ReaderCurrentIndexProvider && other.initIndex == initIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initIndex.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  int runNotifierBuild(
    covariant ReaderCurrentIndex notifier,
  ) {
    return notifier.build(
      initIndex,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
