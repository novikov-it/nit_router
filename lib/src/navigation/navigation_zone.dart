import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'navigation_route.dart';

abstract class NavigationZoneEnum<SessionStateClass extends Listenable>
    implements Enum {
  final NavigationRoute route;

  NavigationZoneEnum(this.route);

  String get root;
  Page<dynamic> pageBuilder(BuildContext context, GoRouterState state);

  /// Function to check if user has access to this navigation zone
  bool hasAccess(SessionStateClass sessionState);

  /// Function to return the home navigation zone
  ///
  /// If not implemented, the home navigation zone will be the first navigation
  /// zone
  // NavigationZoneEnum? home(SessionStateClass sessionState);
}
