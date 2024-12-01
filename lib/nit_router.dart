library nit_router;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nit_router/src/domain/nit_redirects_model.dart';
import 'src/widget/not_found_page.dart';

import 'src/navigation/navigation_zone.dart';
export 'src/navigation/navigation_zone.dart';
export 'src/navigation/navigation_route.dart';
export 'src/navigation/navigation_page_builder.dart';
export 'src/navigation/nit_menu_item.dart';
export 'src/navigation/nit_menu.dart';
export 'src/navigation/default_navigation_mixin.dart';
export 'src/navigation/common_navigation_parameters.dart';
export 'src/ref_extensions.dart';
export 'src/providers.dart';
export 'src/domain/nit_redirects_model.dart';
export 'src/domain/nit_router_provider.dart';

extension on NavigationZoneEnum {
  String get path => '${route.parent == null ? root : ''}${route.path}';
}

class NitRouter {
// class NitRouter<SessionStateClass extends Listenable> extends GoRouter {

  // static GoRouter? _previousRouter;

  static prepareRouterProvider({
    required List<List<NavigationZoneEnum>> navigationZones,
    // required Provider<Map<NavigationZoneEnum, NavigationZoneEnum>>?
    required Provider<NitRedirectsStateModel>? redirectProvider,
  }) =>
      Provider((ref) {
        final redirects =
            redirectProvider != null ? ref.watch(redirectProvider) : null;
        print(redirects);
        // final t = _previousRouter;

        // final t2 =
        //     _previousRouter?.routerDelegate.currentConfiguration.uri.toString();
        final t3 = navigationZones.first.first.path;

        return
            //  _previousRouter =
            NitRouter.prepareRouter(
          // navigatorKey: navigatorKey,
          // initialLocation: _previousRouter
          //     ?.routerDelegate.currentConfiguration.uri
          //     .toString(),
          navigationZones: navigationZones,
          redirect: (context, route) {
            return redirects?.redirects[route];
          },
        );
      });

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
    String? initialLocation,
    Listenable? refreshListenable,
    NavigationZoneEnum? Function(
      BuildContext context,
      NavigationZoneEnum? route,
    )? redirect,
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
      initialLocation: initialLocation ?? navigationZones.first.first.path,
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
      redirect: redirect == null
          ? null
          : (context, state) {
              final match = state.uri
                  .toString()
                  .split('/')
                  .whereNot((p) => p.isEmpty)
                  .first;

              final currentRoute = navigationZones
                  .expand((e) => e)
                  .firstWhereOrNull((route) =>
                      route.path.split('/').whereNot((p) => p.isEmpty).first ==
                      match);

              final res = redirect(context, currentRoute)?.path;

              return res;
            },
    );
  }
}
