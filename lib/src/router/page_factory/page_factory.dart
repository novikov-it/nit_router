import 'package:flutter/material.dart';
import 'package:nit_router/nit_router.dart';

typedef PageFactory = Page<dynamic> Function(
  NavigationZoneRoute route,
  BuildContext context,
  GoRouterState state,
  Widget child,
);

/// Appearance of material design
Page<dynamic> materialPageFactory(
  NavigationZoneRoute route,
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  return MaterialPage(
    key: ValueKey('${route.name}-${state.fullPath}'),
    child: child,
  );
}

/// Smooth appearance (fade)
Page<dynamic> fadePageFactory(
  NavigationZoneRoute route,
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  return CustomTransitionPage(
    key: ValueKey('${route.name}-${state.fullPath}'),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

/// Slide from right to left
Page<dynamic> slideFromRightPageFactory(
  NavigationZoneRoute route,
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  return CustomTransitionPage(
    key: ValueKey('${route.name}-${state.fullPath}'),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
