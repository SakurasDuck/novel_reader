// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novel_directory_converter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getNovelDirectoryConverterHash() =>
    r'08b0168d73e8e0a67c4326126a04770f4b793e74';

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

typedef GetNovelDirectoryConverterRef = AutoDisposeProviderRef<ConverterTyped>;

/// See also [getNovelDirectoryConverter].
@ProviderFor(getNovelDirectoryConverter)
const getNovelDirectoryConverterProvider = GetNovelDirectoryConverterFamily();

/// See also [getNovelDirectoryConverter].
class GetNovelDirectoryConverterFamily extends Family<ConverterTyped> {
  /// See also [getNovelDirectoryConverter].
  const GetNovelDirectoryConverterFamily();

  /// See also [getNovelDirectoryConverter].
  GetNovelDirectoryConverterProvider call(
    NovelFileType novelFileType,
  ) {
    return GetNovelDirectoryConverterProvider(
      novelFileType,
    );
  }

  @override
  GetNovelDirectoryConverterProvider getProviderOverride(
    covariant GetNovelDirectoryConverterProvider provider,
  ) {
    return call(
      provider.novelFileType,
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
  String? get name => r'getNovelDirectoryConverterProvider';
}

/// See also [getNovelDirectoryConverter].
class GetNovelDirectoryConverterProvider
    extends AutoDisposeProvider<ConverterTyped> {
  /// See also [getNovelDirectoryConverter].
  GetNovelDirectoryConverterProvider(
    this.novelFileType,
  ) : super.internal(
          (ref) => getNovelDirectoryConverter(
            ref,
            novelFileType,
          ),
          from: getNovelDirectoryConverterProvider,
          name: r'getNovelDirectoryConverterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getNovelDirectoryConverterHash,
          dependencies: GetNovelDirectoryConverterFamily._dependencies,
          allTransitiveDependencies:
              GetNovelDirectoryConverterFamily._allTransitiveDependencies,
        );

  final NovelFileType novelFileType;

  @override
  bool operator ==(Object other) {
    return other is GetNovelDirectoryConverterProvider &&
        other.novelFileType == novelFileType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, novelFileType.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
