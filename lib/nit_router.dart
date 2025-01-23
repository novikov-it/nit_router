library nit_router;

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
export 'src/ref_extensions.dart';
export 'src/providers.dart';
export 'src/domain/nit_redirects_model.dart';
export 'src/domain/nit_router_provider.dart';

extension NavigationZoneExtension on NavigationZoneEnum {
  String get path =>
      '${route.parent == null ? '/$root${root != '' && route.path != '' ? '/' : ''}' : ''}${route.path}';
  String get fullPath =>
      route.parent == null ? path : '${route.parent!.fullPath}/${route.path}';
}

class NitRouter {
// class NitRouter<SessionStateClass extends Listenable> extends GoRouter {

  // static GoRouter? _previousRouter;

  // static prepareRouterProvider({
  //   required List<List<NavigationZoneEnum>> navigationZones,
  //   // required Provider<Map<NavigationZoneEnum, NavigationZoneEnum>>?
  //   required Provider<NitRedirectsStateModel>? redirectProvider,
  // }) =>
  //     Provider((ref) {
  //       final redirects =
  //           redirectProvider != null ? ref.watch(redirectProvider) : null;
  //       print(redirects);
  //       // final t = _previousRouter;

  //       // final t2 =
  //       //     _previousRouter?.routerDelegate.currentConfiguration.uri.toString();
  //       // final t3 = navigationZones.first.first.path;

  //       return
  //           //  _previousRouter =
  //           NitRouter.prepareRouter(
  //         // navigatorKey: navigatorKey,
  //         // initialLocation: _previousRouter
  //         //     ?.routerDelegate.currentConfiguration.uri
  //         //     .toString(),
  //         navigationZones: navigationZones,
  //         redirect: (context, route) {
  //           return redirects?.redirects[route];
  //         },
  //       );
  //     });

  static GoRoute _buildRoute(
    NavigationZoneEnum route,
    List<List<NavigationZoneEnum>> zones,
  ) {
    return GoRoute(
      path: route.path,
      name: route.name,
      pageBuilder: route.pageBuilder,
      routes: zones
          .map((zone) => zone
              .where((e) => e.route.parent == route)
              .map(
                (e) => _buildRoute(e, zones),
              )
              .toList())
          .expand((x) => x)
          .toList(),

      //  zones.where((zone) =>
      //     ).expand((x) => x).toList(),
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
                      navigationZones,
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
              // final match = state.uri
              //         .toString()
              //         .split('/')
              //         .whereNot((p) => p.isEmpty)
              //         .firstOrNull ??
              //     '';

              // final currentRoute = navigationZones
              //     .expand((e) => e)
              //     .firstWhereOrNull((route) =>
              //         route.path.split('/').whereNot((p) => p.isEmpty).first ==
              //         match);
              final currentRoute = _getCurrentRoute(
                  state.uri, navigationZones.expand((e) => e).toList());

              final res = redirect(context, currentRoute)?.path;

              return res;
            },
    );
  }

  static _getCurrentRoute(
    Uri currentUri,
    List<NavigationZoneEnum> navigationRoutes,
  ) {
    final urlSections = currentUri.toString().split('?')[0].split('/');
    // print(urlSections);
    final currentRoute = navigationRoutes.firstWhere((element) {
      // print('${element.route!.root}${element.route!.route.path}');

      final routeSections = element.fullPath.split('/');

      for (var i = 0; i < urlSections.length; i++) {
        if (i >= routeSections.length) {
          // print('${urlSections[i]} does not match ${routeSections[i]}');

          return false;
        }
        if (routeSections[i].startsWith(':') ||
            urlSections[i] == routeSections[i]) {
          // print('${urlSections[i]} matches ${routeSections[i]}');
          continue;
        } else {
          // print('${urlSections[i]} does not match ${routeSections[i]}');

          return false;
        }
      }

      return true;

      // return GoRouterState.of(context).uri.toString().contains(
      //     '${element.route!.root}${element.route!.route.path}'); //TODO: fix location here
    });

    return currentRoute;
  }
}
