import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../navigation_zones/navigation_zone_route.dart';
import 'nit_menu_item.dart';

class NitBottomNavigationBar extends ConsumerStatefulWidget {
  const NitBottomNavigationBar({
    super.key,
    required this.menuItems,
    this.bottomNavigationBarTheme,
    this.itemBuilder = defaultItemBuilder,
    this.pathParameters,
    this.showSelectedLabels,
    this.showUnselectedLabels,
    this.type,
  });

  final List<NitMenuItem> menuItems;
  final BottomNavigationBarThemeData? bottomNavigationBarTheme;
  final BottomNavigationBarItem Function(
    WidgetRef ref,
    NitMenuItem item,
    bool isActive,
  ) itemBuilder;
  final Map<String, String>? pathParameters;
  final bool? showSelectedLabels;
  final bool? showUnselectedLabels;
  final BottomNavigationBarType? type;

  static BottomNavigationBarItem defaultItemBuilder(
    WidgetRef ref,
    NitMenuItem item,
    bool isActive,
  ) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          item.svgIcon != null
              ? SvgPicture.asset(
                  placeholderBuilder: (context) => const SizedBox.square(
                    dimension: 24,
                  ),
                  isActive
                      ? item.activeSvgIcon ?? item.svgIcon!
                      : item.svgIcon!,
                  colorFilter: item.changeIconColor
                      ? ColorFilter.mode(
                          isActive
                              ? Theme.of(ref.context)
                                  .colorScheme
                                  .primaryFixedDim
                              : Theme.of(ref.context).colorScheme.outline,
                          BlendMode.srcIn,
                        )
                      : null,
                )
              : Icon(
                  isActive
                      ? item.activeIconData ?? item.iconData!
                      : item.iconData!,
                ),
          if (item.displayProvider != null)
            Builder(
              builder: (context) {
                final state = ref.watch(item.displayProvider!);

                if (state is int && state > 0) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                    child: Text(
                      '$state',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.error,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
        ],
      ),
      label: item.displayTitle,
    );
  }

  @override
  ConsumerState<NitBottomNavigationBar> createState() =>
      _MainNavigationBarState();
}

class _MainNavigationBarState extends ConsumerState<NitBottomNavigationBar> {
  int _currentIndex = -1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (mounted) {
      final uri = GoRouter.of(context).routerDelegate.currentConfiguration.uri;
      final urlSections =
          // GoRouterState.of(context).
          uri.toString().split('?')[0].split('/');
      _currentIndex = widget.menuItems.indexWhere((element) {
        if (element.route == null) return false;

        final routeSections = element.route!.fullPath.split('/');

        for (var i = 0; i < urlSections.length; i++) {
          if (i >= routeSections.length) {
            return true;
          }
          if (routeSections[i].startsWith(':') ||
              urlSections[i] == routeSections[i]) {
            continue;
          } else {
            return false;
          }
        }

        return true;
      });

      if (_currentIndex == -1 || _currentIndex > widget.menuItems.length) {
        _currentIndex = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.bottomNavigationBarTheme ??
        Theme.of(context).bottomNavigationBarTheme;
    return BottomNavigationBarTheme(
      data: theme,
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: theme.elevation ?? 0,
        // backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
        // selectedLabelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
        //       color: Theme.of(context).colorScheme.secondary.withOpacity(0.50),
        //       fontSize: 12,
        //     ),
        // unselectedLabelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
        //       color: Theme.of(context).colorScheme.secondary.withOpacity(0.50),
        //       fontSize: 12,
        //     ),
        // unselectedItemColor: Theme.of(context).colorScheme.outline,
        // selectedItemColor: Theme.of(context).colorScheme.primaryFixedDim,
        onTap: (index) {
          ref.menuItemTap(widget.menuItems[index]);
          // if (widget.menuItems[index].customOnPressed != null) {
          //   widget.menuItems[index].customOnPressed!(ref);
          // } else if (widget.menuItems[index].route != null) {
          //   context.goNamed(
          //     widget.menuItems[index].route!.name,
          //     pathParameters: widget.pathParameters ?? {},
          //   );
          // }
        },
        showSelectedLabels: widget.showSelectedLabels,
        showUnselectedLabels: widget.showUnselectedLabels,
        type: widget.type,
        items: widget.menuItems
            .mapIndexed(
              (index, item) => widget.itemBuilder(
                ref,
                item,
                index == _currentIndex,
              ),
            )
            .toList(),
      ),
    );
  }
}
