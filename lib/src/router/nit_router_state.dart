import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nit_router/nit_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nit_router_state.g.dart';

@riverpod
class NitRouterState extends _$NitRouterState {
  GoRouter? _previousRouter;

  @override
  GoRouter build({
    required List<List<NavigationZoneRoute>> navigationZones,
    Provider<RedirectsStateModel>? redirectsProvider,
    NavigationZoneRoute? Function(
      BuildContext context,
      GoRouterState state,
    )? manualRedirect,
    PageFactory pageFactory = materialPageFactory,
  }) {
    final redirects =
        redirectsProvider != null ? ref.watch(redirectsProvider) : null;

    return _previousRouter = NitRouter.prepareRouter(
      // navigatorKey: navigatorKey,
      navigationZones: navigationZones,
      notFoundPageWidget: NotFoundPageWidget(
        redirectRoute: navigationZones.first.first,
      ),
      initialLocation:
          _previousRouter?.routerDelegate.currentConfiguration.uri.toString(),
      manualRedirect: manualRedirect,
      pageFactory: pageFactory,
      redirect: (context, route) {
        return redirects?.redirects[route];
      },
    );
  }
}
