import 'package:flutter/material.dart';

import 'navigation_zone.dart';

class NavigationRoute {
  const NavigationRoute({
    required this.path,
    required this.page,
    this.parent,
  });

  final String path;
  final Widget page;
  final NavigationZoneEnum? parent;
}
