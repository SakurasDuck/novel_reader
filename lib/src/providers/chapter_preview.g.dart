// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_preview.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$readChapterContentHash() =>
    r'06c6f9094c9b5196aef30d35d8b16065598b49af';

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

typedef ReadChapterContentRef = AutoDisposeFutureProviderRef<String>;

/// See also [readChapterContent].
@ProviderFor(readChapterContent)
const readChapterContentProvider = ReadChapterContentFamily();

/// See also [readChapterContent].
class ReadChapterContentFamily extends Family<AsyncValue<String>> {
  /// See also [readChapterContent].
  const ReadChapterContentFamily();

  /// See also [readChapterContent].
  ReadChapterContentProvider call(
    Novel novel,
    NovelChapter chapter,
  ) {
    return ReadChapterContentProvider(
      novel,
      chapter,
    );
  }

  @override
  ReadChapterContentProvider getProviderOverride(
    covariant ReadChapterContentProvider provider,
  ) {
    return call(
      provider.novel,
      provider.chapter,
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
  String? get name => r'readChapterContentProvider';
}

/// See also [readChapterContent].
class ReadChapterContentProvider extends AutoDisposeFutureProvider<String> {
  /// See also [readChapterContent].
  ReadChapterContentProvider(
    this.novel,
    this.chapter,
  ) : super.internal(
          (ref) => readChapterContent(
            ref,
            novel,
            chapter,
          ),
          from: readChapterContentProvider,
          name: r'readChapterContentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$readChapterContentHash,
          dependencies: ReadChapterContentFamily._dependencies,
          allTransitiveDependencies:
              ReadChapterContentFamily._allTransitiveDependencies,
        );

  final Novel novel;
  final NovelChapter chapter;

  @override
  bool operator ==(Object other) {
    return other is ReadChapterContentProvider &&
        other.novel == novel &&
        other.chapter == chapter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, novel.hashCode);
    hash = _SystemHash.combine(hash, chapter.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
