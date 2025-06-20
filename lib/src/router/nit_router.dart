import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../navigation_params/navigation_parameters_providers.dart';
import '../navigation_zones/navigation_zone_route.dart';

class NitRouter {
  static bool skipZoneInRouteNames = true;

  static final _routerKey =
      GlobalKey<NavigatorState>(debugLabel: 'nitRouterKey');

  static configure({
    required bool skipZoneInRouteNames,
  }) {
    NitRouter.skipZoneInRouteNames = skipZoneInRouteNames;
  }

  static GoRouter prepareRouter({
    required List<List<NavigationZoneRoute>> navigationZones,
    required Widget notFoundPageWidget,
    String? initialLocation,
    Listenable? refreshListenable,
    NavigationZoneRoute? Function(
      BuildContext context,
      NavigationZoneRoute? route,
    )? redirect,
    NavigationZoneRoute? Function(
      BuildContext context,
      GoRouterState state,
    )? manualRedirect,
  }) {
    return GoRouter(
      navigatorKey: _routerKey,
      debugLogDiagnostics: true,
      errorBuilder: (context, state) {
        debugPrint('NitRouter error with path ${state.fullPath}');
        return notFoundPageWidget;
      },
      routerNeglect: true,
      initialLocation: initialLocation ?? navigationZones.first.first.routePath,
      routes: <GoRoute>[
        ...navigationZones
            .map(
              (zone) => zone.where((e) => e.descriptor.parent == null).map(
                    (route) => _buildRoute(
                      route,
                      navigationZones,
                    ),
                  ),
            )
            .expand((element) => element),
      ],
      refreshListenable: refreshListenable,
      redirect: (context, state) {
        if (manualRedirect != null) {
          final route = manualRedirect(context, state);
          if (route != null) return route.routePath;
        }

        if (redirect != null) {
          final currentRoute = _getCurrentRoute(
            state.uri,
            navigationZones.expand((e) => e),
          );

          final res = redirect(context, currentRoute)?.routePath;

          return res;
        }
        return null;
      },
    );
  }

  static GoRoute _buildRoute(
    NavigationZoneRoute route,
    List<List<NavigationZoneRoute>> zones,
  ) {
    return GoRoute(
      path: route.routePath,
      name: route.name,
      pageBuilder: (context, state) => MaterialPage(
        child: ProviderScope(
          overrides: [
            navigationPathParametersProvider.overrideWithValue(
              state.pathParameters,
            ),
            navigationExtraParameterProvider.overrideWithValue(
              state.extra,
            ),
          ],
          child: route.descriptor.page,
        ),
      ),
      routes: zones
          .map((zone) => zone
              .where((e) => e.descriptor.parent == route)
              .map((e) => _buildRoute(e, zones)))
          .expand((x) => x)
          .toList(),
    );
  }

  static _getCurrentRoute(
    Uri currentUri,
    Iterable<NavigationZoneRoute> navigationRoutes,
  ) {
    final urlSections = currentUri.toString().split('?')[0].split('/');
    final currentRoute = navigationRoutes.firstWhere(
      (element) {
        final routeSections = element.fullPath.split('/');

        for (var i = 0; i < urlSections.length; i++) {
          if (i >= routeSections.length) {
            return false;
          }
          if (routeSections[i].startsWith(':') ||
              urlSections[i] == routeSections[i]) {
            continue;
          } else {
            return false;
          }
        }

        return true;
      },
    );

    return currentRoute;
  }
}
