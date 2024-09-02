library nit_router;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'src/widget/not_found_page.dart';

import 'src/navigation/navigation_zone.dart';
export 'src/navigation/navigation_zone.dart';
export 'src/navigation/navigation_route.dart';
export 'src/navigation/navigation_page_builder.dart';
export 'src/navigation/nit_menu_item.dart';
export 'src/navigation/nit_menu.dart';
export 'src/navigation/default_navigation_mixin.dart';
export 'src/navigation/common_navigation_parameters.dart';
export 'src/providers.dart';

extension on NavigationZoneEnum {
  String get path => '${route.parent == null ? root : ''}${route.path}';
}

class NitRouter {
// class NitRouter<SessionStateClass extends Listenable> extends GoRouter {
  static GoRoute _buildRoute(
    NavigationZoneEnum route,
    List<NavigationZoneEnum> zone,
  ) {
    return GoRoute(
      path: route.path,
      name: route.name,
      pageBuilder: route.pageBuilder,
      routes: zone
          .where((e) => e.route.parent == route)
          .map(
            (e) => _buildRoute(e, zone),
          )
          .toList(),
    );
  }

  static final _routerKey =
      GlobalKey<NavigatorState>(debugLabel: 'nitRouterKey');

  static GoRouter prepareRouter({
    required List<List<NavigationZoneEnum>> navigationZones,
    required Listenable refreshListenable,
    required NavigationZoneEnum? Function(
      BuildContext context,
      NavigationZoneEnum? route,
    ) redirect,
    // required SessionStateClass sessionState,
    // required NavigationZoneEnum<SessionStateClass> Function(SessionStateClass) home
  }) {
    return GoRouter(
      navigatorKey: _routerKey,
      debugLogDiagnostics: true,
      errorBuilder: (context, state) {
        debugPrint('NitRouter error with path ${state.fullPath}');
        return NotFoundPageWidget(
          redirectPath: navigationZones.first.first.path,
        );
      },
      routerNeglect: true,
      initialLocation: navigationZones.first.first.path,
      routes: <GoRoute>[
        ...navigationZones
            .map(
              (zone) => zone.where((e) => e.route.parent == null).map(
                    (route) => _buildRoute(
                      route,
                      zone,
                    ),
                  ),
            )
            .expand(
              (element) => element.toList(),
            ),
      ],
      refreshListenable: refreshListenable,
      redirect: (context, state) {
        final match =
            state.uri.toString().split('/').whereNot((p) => p.isEmpty).first;
        // final match = state.name;

        // final currentZone = navigationZones.firstWhere(
        //   (zone) => zone.any(
        //     (route) {
        //       return route.path.split('/').whereNot((p) => p.isEmpty).first ==
        //           match;
        //       //     state.uri
        //       //         .toString()
        //       //         .split('/')
        //       //         .whereNot((p) => p.isEmpty)
        //       //         .first;
        //     },
        //   ),
        // );

        final currentRoute = navigationZones.expand((e) => e).firstWhereOrNull(
            (route) =>
                route.path.split('/').whereNot((p) => p.isEmpty).first == match
            //     state.uri
            //         .toString()
            //         .split('/')
            //         .whereNot((p) => p.isEmpty)
            //         .first;

            );

        final res = redirect(context, currentRoute)?.path;

        // if (currentZone.firstOrNull?.hasAccess(sessionState) ?? false) {
        //   return null;
        // }

        // final res2 = home(sessionState).path;

        return res;
      },
    );
  }
}
