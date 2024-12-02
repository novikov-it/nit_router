import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../nit_router.dart';

part 'nit_router_provider.g.dart';
// part 'nit_router_provider.freezed.dart';

// @freezed
// abstract class NitRouterStateModel with _$NitRouterStateModel {
//   const factory NitRouterStateModel() = _NitRouterStateModel;
// }

@riverpod
class NitRouterState extends _$NitRouterState {
  GoRouter? _previousRouter;

  @override
  GoRouter build(
    List<List<NavigationZoneEnum>> navigationZones,
    Provider<NitRedirectsStateModel>? redirectProvider,
  ) {
    final redirects =
        redirectProvider != null ? ref.watch(redirectProvider) : null;
    // print(redirects);
    // final t = _previousRouter;

    // final t2 =
    //     _previousRouter?.routerDelegate.currentConfiguration.uri.toString();
    // final t3 = navigationZones.first.first.path;

    return _previousRouter = NitRouter.prepareRouter(
      // navigatorKey: navigatorKey,
      initialLocation:
          _previousRouter?.routerDelegate.currentConfiguration.uri.toString(),
      navigationZones: navigationZones,
      redirect: (context, route) {
        return redirects?.redirects[route];
      },
    );
  }
}
