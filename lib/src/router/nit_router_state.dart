import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../navigation_zones/navigation_zone_route.dart';
import '../redirects/redirects_state_model.dart';
import '../widgets/not_found_page.dart';
import 'nit_router.dart';

part 'nit_router_state.g.dart';

@riverpod
class NitRouterState extends _$NitRouterState {
  GoRouter? _previousRouter;

  @override
  GoRouter build({
    required List<List<NavigationZoneRoute>> navigationZones,
    Provider<RedirectsStateModel>? redirectsProvider,
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
      redirect: (context, route) {
        return redirects?.redirects[route];
      },
    );
  }
}
