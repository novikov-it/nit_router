import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'navigation_zone.dart';

class NitMenuItem {
  NitMenuItem({
    required this.displayTitle,
    required this.svgIcon,
    this.route,
    this.onPressed,
    this.displayProvider,
  }) {
    assert(
      (route != null || onPressed != null) &&
          (route == null || onPressed == null),
      'Either route or onPressed must be provided',
    );
  }

  /// This function must handle notifying itself
  final Function(BuildContext, WidgetRef)? onPressed;
  final NavigationZoneEnum? route;
  final String displayTitle;
  final String svgIcon;
  final ProviderListenable? displayProvider;
}
