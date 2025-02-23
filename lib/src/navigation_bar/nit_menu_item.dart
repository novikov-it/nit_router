import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../navigation_zones/navigation_zone_route.dart';

class NitMenuItem {
  const NitMenuItem.svg({
    required this.route,
    required this.displayTitle,
    required this.svgIcon,
    this.customOnPressed,
    this.displayProvider,
  }) : iconData = null;

  const NitMenuItem.icon({
    required this.route,
    required this.displayTitle,
    required this.iconData,
    this.customOnPressed,
    this.displayProvider,
  }) : svgIcon = null;

  final NavigationZoneRoute? route;
  final String displayTitle;
  final IconData? iconData;
  final String? svgIcon;
  final Function(BuildContext, WidgetRef)? customOnPressed;
  final ProviderListenable? displayProvider;
}
