import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers.dart';
import '../widget/fade_transition_page.dart';
import 'navigation_route.dart';

Page<dynamic> navigationPageBuilder({
  required BuildContext context,
  required GoRouterState state,
  required NavigationRoute route,
  Widget Function(Widget child)? wrapper,
  List<Override> overrides = const [],
}) {
  // ProviderScope.containerOf(context)
  //     .read(navigationPathParametersProvider.notifier)
  //     .state = state.pathParameters;
  return FadeTransitionPage(
    child: ProviderScope(
      overrides: [
        navigationPathParametersProvider.overrideWithValue(
          state.pathParameters,
        ),
        // navigationExtraParameterProvider.overrideWithValue(
        //   state.extra,
        // ),
        ...overrides,
      ],
      child: wrapper != null ? wrapper(route.page) : route.page,
    ),
  );
}
