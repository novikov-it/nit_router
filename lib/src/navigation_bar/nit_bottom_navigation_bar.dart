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
    BuildContext context,
    WidgetRef ref,
    NitMenuItem item,
    bool isActive,
  ) itemBuilder;
  final Map<String, String>? pathParameters;
  final bool? showSelectedLabels;
  final bool? showUnselectedLabels;
  final BottomNavigationBarType? type;

  static BottomNavigationBarItem defaultItemBuilder(
    BuildContext context,
    WidgetRef ref,
    NitMenuItem item,
    bool isActive,
  ) =>
      BottomNavigationBarItem(
        icon: Stack(
          children: [
            item.svgIcon != null
                ? SvgPicture.asset(
                    item.svgIcon!,
                    colorFilter: ColorFilter.mode(
                      isActive
                          ? Theme.of(context).colorScheme.primaryFixedDim
                          : Theme.of(context).colorScheme.outline,
                      BlendMode.srcIn,
                    ),
                  )
                : Icon(item.iconData),
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
      final urlSections =
          GoRouterState.of(context).uri.toString().split('?')[0].split('/');
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
    return BottomNavigationBarTheme(
      data: widget.bottomNavigationBarTheme ??
          Theme.of(context).bottomNavigationBarTheme,
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 0,
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
          if (widget.menuItems[index].customOnPressed != null) {
            widget.menuItems[index].customOnPressed!(context, ref);
          } else if (widget.menuItems[index].route != null) {
            context.goNamed(
              widget.menuItems[index].route!.name,
              pathParameters: widget.pathParameters ?? {},
            );
          }
        },
        showSelectedLabels: widget.showSelectedLabels,
        showUnselectedLabels: widget.showUnselectedLabels,
        type: widget.type,
        items: widget.menuItems
            .mapIndexed(
              (index, item) => widget.itemBuilder(
                  context, ref, item, index == _currentIndex),
            )
            .toList(),
      ),
    );
  }
}
