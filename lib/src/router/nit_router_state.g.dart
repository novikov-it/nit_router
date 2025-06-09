// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nit_router_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nitRouterStateHash() => r'037989d874f31c82a752e75a86362b7620fe997e';

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
  late final List<List<NavigationZoneRoute>> navigationZones;
  late final Provider<RedirectsStateModel>? redirectsProvider;
  late final NavigationZoneRoute? Function(BuildContext, GoRouterState)?
      manualRedirect;

  GoRouter build({
    required List<List<NavigationZoneRoute>> navigationZones,
    Provider<RedirectsStateModel>? redirectsProvider,
    NavigationZoneRoute? Function(BuildContext, GoRouterState)? manualRedirect,
  });
}

/// See also [NitRouterState].
@ProviderFor(NitRouterState)
const nitRouterStateProvider = NitRouterStateFamily();

/// See also [NitRouterState].
class NitRouterStateFamily extends Family<GoRouter> {
  /// See also [NitRouterState].
  const NitRouterStateFamily();

  /// See also [NitRouterState].
  NitRouterStateProvider call({
    required List<List<NavigationZoneRoute>> navigationZones,
    Provider<RedirectsStateModel>? redirectsProvider,
    NavigationZoneRoute? Function(BuildContext, GoRouterState)? manualRedirect,
  }) {
    return NitRouterStateProvider(
      navigationZones: navigationZones,
      redirectsProvider: redirectsProvider,
      manualRedirect: manualRedirect,
    );
  }

  @override
  NitRouterStateProvider getProviderOverride(
    covariant NitRouterStateProvider provider,
  ) {
    return call(
      navigationZones: provider.navigationZones,
      redirectsProvider: provider.redirectsProvider,
      manualRedirect: provider.manualRedirect,
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
  NitRouterStateProvider({
    required List<List<NavigationZoneRoute>> navigationZones,
    Provider<RedirectsStateModel>? redirectsProvider,
    NavigationZoneRoute? Function(BuildContext, GoRouterState)? manualRedirect,
  }) : this._internal(
          () => NitRouterState()
            ..navigationZones = navigationZones
            ..redirectsProvider = redirectsProvider
            ..manualRedirect = manualRedirect,
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
          redirectsProvider: redirectsProvider,
          manualRedirect: manualRedirect,
        );

  NitRouterStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.navigationZones,
    required this.redirectsProvider,
    required this.manualRedirect,
  }) : super.internal();

  final List<List<NavigationZoneRoute>> navigationZones;
  final Provider<RedirectsStateModel>? redirectsProvider;
  final NavigationZoneRoute? Function(BuildContext, GoRouterState)?
      manualRedirect;

  @override
  GoRouter runNotifierBuild(
    covariant NitRouterState notifier,
  ) {
    return notifier.build(
      navigationZones: navigationZones,
      redirectsProvider: redirectsProvider,
      manualRedirect: manualRedirect,
    );
  }

  @override
  Override overrideWith(NitRouterState Function() create) {
    return ProviderOverride(
      origin: this,
      override: NitRouterStateProvider._internal(
        () => create()
          ..navigationZones = navigationZones
          ..redirectsProvider = redirectsProvider
          ..manualRedirect = manualRedirect,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        navigationZones: navigationZones,
        redirectsProvider: redirectsProvider,
        manualRedirect: manualRedirect,
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
        other.redirectsProvider == redirectsProvider &&
        other.manualRedirect == manualRedirect;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, navigationZones.hashCode);
    hash = _SystemHash.combine(hash, redirectsProvider.hashCode);
    hash = _SystemHash.combine(hash, manualRedirect.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NitRouterStateRef on AutoDisposeNotifierProviderRef<GoRouter> {
  /// The parameter `navigationZones` of this provider.
  List<List<NavigationZoneRoute>> get navigationZones;

  /// The parameter `redirectsProvider` of this provider.
  Provider<RedirectsStateModel>? get redirectsProvider;

  /// The parameter `manualRedirect` of this provider.
  NavigationZoneRoute? Function(BuildContext, GoRouterState)?
      get manualRedirect;
}

class _NitRouterStateProviderElement
    extends AutoDisposeNotifierProviderElement<NitRouterState, GoRouter>
    with NitRouterStateRef {
  _NitRouterStateProviderElement(super.provider);

  @override
  List<List<NavigationZoneRoute>> get navigationZones =>
      (origin as NitRouterStateProvider).navigationZones;
  @override
  Provider<RedirectsStateModel>? get redirectsProvider =>
      (origin as NitRouterStateProvider).redirectsProvider;
  @override
  NavigationZoneRoute? Function(BuildContext, GoRouterState)?
      get manualRedirect => (origin as NitRouterStateProvider).manualRedirect;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
