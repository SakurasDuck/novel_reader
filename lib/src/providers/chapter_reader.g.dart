// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_reader.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChapterScheduleCache _$$_ChapterScheduleCacheFromJson(
        Map<String, dynamic> json) =>
    _$_ChapterScheduleCache(
      novelId: json['novelId'] as String,
      chapterIndex: json['chapterIndex'] as int,
      chapterSchedule: (json['chapterSchedule'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ChapterScheduleCacheToJson(
        _$_ChapterScheduleCache instance) =>
    <String, dynamic>{
      'novelId': instance.novelId,
      'chapterIndex': instance.chapterIndex,
      'chapterSchedule': instance.chapterSchedule,
    };

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
String _$cacheCurrentChapterScheduleHash() =>
    r'd0187755467c79092698340c4d0eef3efe01b030';

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

typedef CacheCurrentChapterScheduleRef = AutoDisposeFutureProviderRef<void>;

/// See also [cacheCurrentChapterSchedule].
@ProviderFor(cacheCurrentChapterSchedule)
const cacheCurrentChapterScheduleProvider = CacheCurrentChapterScheduleFamily();

/// See also [cacheCurrentChapterSchedule].
class CacheCurrentChapterScheduleFamily extends Family<AsyncValue<void>> {
  /// See also [cacheCurrentChapterSchedule].
  const CacheCurrentChapterScheduleFamily();

  /// See also [cacheCurrentChapterSchedule].
  CacheCurrentChapterScheduleProvider call(
    ChapterScheduleCache schedule,
  ) {
    return CacheCurrentChapterScheduleProvider(
      schedule,
    );
  }

  @override
  CacheCurrentChapterScheduleProvider getProviderOverride(
    covariant CacheCurrentChapterScheduleProvider provider,
  ) {
    return call(
      provider.schedule,
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
  String? get name => r'cacheCurrentChapterScheduleProvider';
}

/// See also [cacheCurrentChapterSchedule].
class CacheCurrentChapterScheduleProvider
    extends AutoDisposeFutureProvider<void> {
  /// See also [cacheCurrentChapterSchedule].
  CacheCurrentChapterScheduleProvider(
    this.schedule,
  ) : super.internal(
          (ref) => cacheCurrentChapterSchedule(
            ref,
            schedule,
          ),
          from: cacheCurrentChapterScheduleProvider,
          name: r'cacheCurrentChapterScheduleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cacheCurrentChapterScheduleHash,
          dependencies: CacheCurrentChapterScheduleFamily._dependencies,
          allTransitiveDependencies:
              CacheCurrentChapterScheduleFamily._allTransitiveDependencies,
        );

  final ChapterScheduleCache schedule;

  @override
  bool operator ==(Object other) {
    return other is CacheCurrentChapterScheduleProvider &&
        other.schedule == schedule;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, schedule.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$getCurrentChapterScheduleHash() =>
    r'0b1bbf0921d3bdcdf9fd500801795a9bec191bf3';
typedef GetCurrentChapterScheduleRef
    = AutoDisposeFutureProviderRef<ChapterScheduleCache?>;

/// See also [getCurrentChapterSchedule].
@ProviderFor(getCurrentChapterSchedule)
const getCurrentChapterScheduleProvider = GetCurrentChapterScheduleFamily();

/// See also [getCurrentChapterSchedule].
class GetCurrentChapterScheduleFamily
    extends Family<AsyncValue<ChapterScheduleCache?>> {
  /// See also [getCurrentChapterSchedule].
  const GetCurrentChapterScheduleFamily();

  /// See also [getCurrentChapterSchedule].
  GetCurrentChapterScheduleProvider call(
    String novelId,
  ) {
    return GetCurrentChapterScheduleProvider(
      novelId,
    );
  }

  @override
  GetCurrentChapterScheduleProvider getProviderOverride(
    covariant GetCurrentChapterScheduleProvider provider,
  ) {
    return call(
      provider.novelId,
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
  String? get name => r'getCurrentChapterScheduleProvider';
}

/// See also [getCurrentChapterSchedule].
class GetCurrentChapterScheduleProvider
    extends AutoDisposeFutureProvider<ChapterScheduleCache?> {
  /// See also [getCurrentChapterSchedule].
  GetCurrentChapterScheduleProvider(
    this.novelId,
  ) : super.internal(
          (ref) => getCurrentChapterSchedule(
            ref,
            novelId,
          ),
          from: getCurrentChapterScheduleProvider,
          name: r'getCurrentChapterScheduleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCurrentChapterScheduleHash,
          dependencies: GetCurrentChapterScheduleFamily._dependencies,
          allTransitiveDependencies:
              GetCurrentChapterScheduleFamily._allTransitiveDependencies,
        );

  final String novelId;

  @override
  bool operator ==(Object other) {
    return other is GetCurrentChapterScheduleProvider &&
        other.novelId == novelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, novelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$chapterReaderHash() => r'807b4cbfdba18e97da8fa64444ca8805732417e3';

abstract class _$ChapterReader
    extends BuildlessAutoDisposeNotifier<ChapterReaderState> {
  late final Novel novel;
  late final ChapterScheduleCache schedule;

  ChapterReaderState build(
    Novel novel,
    ChapterScheduleCache schedule,
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
    ChapterScheduleCache schedule,
  ) {
    return ChapterReaderProvider(
      novel,
      schedule,
    );
  }

  @override
  ChapterReaderProvider getProviderOverride(
    covariant ChapterReaderProvider provider,
  ) {
    return call(
      provider.novel,
      provider.schedule,
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
    this.schedule,
  ) : super.internal(
          () => ChapterReader()
            ..novel = novel
            ..schedule = schedule,
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
  final ChapterScheduleCache schedule;

  @override
  bool operator ==(Object other) {
    return other is ChapterReaderProvider &&
        other.novel == novel &&
        other.schedule == schedule;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, novel.hashCode);
    hash = _SystemHash.combine(hash, schedule.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  ChapterReaderState runNotifierBuild(
    covariant ChapterReader notifier,
  ) {
    return notifier.build(
      novel,
      schedule,
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
