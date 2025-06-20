import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nit_router/nit_router.dart';

extension NitMenuItemWidgetRefExtension on WidgetRef {
  menuItemTap(
    NitMenuItem item, {
    Map<String, String>? pathParameters,
  }) {
    if (item.customOnPressed != null) {
      item.customOnPressed!(this);
    } else if (item.route != null) {
      context.goNamed(
        item.route!.name,
        pathParameters: pathParameters ?? {},
      );
    }
  }
}

class NitMenuItem {
  const NitMenuItem.svg({
    required this.route,
    required this.displayTitle,
    required this.svgIcon,
    this.activeSvgIcon,
    this.customOnPressed,
    this.displayProvider,
    this.changeIconColor = true,
  })  : iconData = null,
        activeIconData = null;

  const NitMenuItem.icon({
    required this.route,
    required this.displayTitle,
    required this.iconData,
    this.activeIconData,
    this.customOnPressed,
    this.displayProvider,
  })  : svgIcon = null,
        activeSvgIcon = null,
        changeIconColor = false;

  final NavigationZoneRoute? route;
  final String displayTitle;
  final IconData? iconData;
  final String? svgIcon;
  final IconData? activeIconData;
  final String? activeSvgIcon;
  final Function(WidgetRef)? customOnPressed;
  final ProviderListenable? displayProvider;
  final bool changeIconColor;
}
