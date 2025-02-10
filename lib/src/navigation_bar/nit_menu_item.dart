import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../navigation_zones/navigation_zone_route.dart';

class NitMenuItem {
  NitMenuItem({
    required this.displayTitle,
    this.iconData,
    this.svgIcon,
    this.route,
    this.onPressed,
    this.displayProvider,
  }) {
    assert(
      (iconData != null || svgIcon != null) &&
          (iconData == null || svgIcon == null),
      'Either route or onPressed must be provided',
    );
    assert(
      (route != null || onPressed != null) &&
          (route == null || onPressed == null),
      'Either route or onPressed must be provided',
    );
  }

  /// This function must handle notifying itself
  final Function(BuildContext, WidgetRef)? onPressed;
  final NavigationZoneRoute? route;
  final String displayTitle;
  final IconData? iconData;
  final String? svgIcon;
  final ProviderListenable? displayProvider;
}
