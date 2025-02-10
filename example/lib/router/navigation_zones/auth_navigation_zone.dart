part of '../router.dart';

/// Navigation zone for Authentication pages
///
/// These pages are available when user is not logged in
enum AuthNavigationZone implements NavigationZoneRoute {
  signIn(
    SimpleNavigationRouteDescriptor(
      page: SignInPage(),
    ),
  );

  const AuthNavigationZone(this.descriptor);

  @override
  final NavigationRouteDescriptor descriptor;

  @override
  String get root => '';
}
