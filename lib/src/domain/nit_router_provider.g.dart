// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nit_router_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nitRouterStateHash() => r'166ec10fe8a774ca7093179c92b293b3fa7ff9e2';

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

abstract class _$NitRouterState extends BuildlessAutoDisposeNotifier<GoRouter> {
  late final List<List<NavigationZoneEnum<Listenable>>> navigationZones;
  late final Provider<NitRedirectsStateModel>? redirectProvider;

  GoRouter build(
    List<List<NavigationZoneEnum<Listenable>>> navigationZones,
    Provider<NitRedirectsStateModel>? redirectProvider,
  );
}

/// See also [NitRouterState].
@ProviderFor(NitRouterState)
const nitRouterStateProvider = NitRouterStateFamily();

/// See also [NitRouterState].
class NitRouterStateFamily extends Family<GoRouter> {
  /// See also [NitRouterState].
  const NitRouterStateFamily();

  /// See also [NitRouterState].
  NitRouterStateProvider call(
    List<List<NavigationZoneEnum<Listenable>>> navigationZones,
    Provider<NitRedirectsStateModel>? redirectProvider,
  ) {
    return NitRouterStateProvider(
      navigationZones,
      redirectProvider,
    );
  }

  @override
  NitRouterStateProvider getProviderOverride(
    covariant NitRouterStateProvider provider,
  ) {
    return call(
      provider.navigationZones,
      provider.redirectProvider,
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
  String? get name => r'nitRouterStateProvider';
}

/// See also [NitRouterState].
class NitRouterStateProvider
    extends AutoDisposeNotifierProviderImpl<NitRouterState, GoRouter> {
  /// See also [NitRouterState].
  NitRouterStateProvider(
    List<List<NavigationZoneEnum<Listenable>>> navigationZones,
    Provider<NitRedirectsStateModel>? redirectProvider,
  ) : this._internal(
          () => NitRouterState()
            ..navigationZones = navigationZones
            ..redirectProvider = redirectProvider,
          from: nitRouterStateProvider,
          name: r'nitRouterStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$nitRouterStateHash,
          dependencies: NitRouterStateFamily._dependencies,
          allTransitiveDependencies:
              NitRouterStateFamily._allTransitiveDependencies,
          navigationZones: navigationZones,
          redirectProvider: redirectProvider,
        );

  NitRouterStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.navigationZones,
    required this.redirectProvider,
  }) : super.internal();

  final List<List<NavigationZoneEnum<Listenable>>> navigationZones;
  final Provider<NitRedirectsStateModel>? redirectProvider;

  @override
  GoRouter runNotifierBuild(
    covariant NitRouterState notifier,
  ) {
    return notifier.build(
      navigationZones,
      redirectProvider,
    );
  }

  @override
  Override overrideWith(NitRouterState Function() create) {
    return ProviderOverride(
      origin: this,
      override: NitRouterStateProvider._internal(
        () => create()
          ..navigationZones = navigationZones
          ..redirectProvider = redirectProvider,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        navigationZones: navigationZones,
        redirectProvider: redirectProvider,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<NitRouterState, GoRouter> createElement() {
    return _NitRouterStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NitRouterStateProvider &&
        other.navigationZones == navigationZones &&
        other.redirectProvider == redirectProvider;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, navigationZones.hashCode);
    hash = _SystemHash.combine(hash, redirectProvider.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NitRouterStateRef on AutoDisposeNotifierProviderRef<GoRouter> {
  /// The parameter `navigationZones` of this provider.
  List<List<NavigationZoneEnum<Listenable>>> get navigationZones;

  /// The parameter `redirectProvider` of this provider.
  Provider<NitRedirectsStateModel>? get redirectProvider;
}

class _NitRouterStateProviderElement
    extends AutoDisposeNotifierProviderElement<NitRouterState, GoRouter>
    with NitRouterStateRef {
  _NitRouterStateProviderElement(super.provider);

  @override
  List<List<NavigationZoneEnum<Listenable>>> get navigationZones =>
      (origin as NitRouterStateProvider).navigationZones;
  @override
  Provider<NitRedirectsStateModel>? get redirectProvider =>
      (origin as NitRouterStateProvider).redirectProvider;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
