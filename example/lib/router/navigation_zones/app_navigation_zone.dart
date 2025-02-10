part of '../router.dart';

/// Navigation zone for App pages
///
/// These pages are available when user is logged in
enum AppNavigationZone implements NavigationZoneRoute {
  home(
    SimpleNavigationRouteDescriptor(
      page: HomePage(),
    ),
  ),
  catalog(
    SimpleNavigationRouteDescriptor(
      page: CatalogPage(),
    ),
  ),
  product(
    ParameterizedNavigationRouteDescriptor(
      parameter: AppNavigationParams.productId,
      page: ProductPage(),
      parent: AppNavigationZone.catalog,
    ),
  );

  const AppNavigationZone(this.descriptor);

  @override
  final NavigationRouteDescriptor descriptor;

  @override
  String get root => '';
}
