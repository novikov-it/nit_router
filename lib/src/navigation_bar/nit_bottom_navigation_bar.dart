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
    this.pathParameters,
  });

  final List<NitMenuItem> menuItems;
  final Map<String, String>? pathParameters;

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
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      selectedLabelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.50),
            fontSize: 12,
          ),
      unselectedLabelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.50),
            fontSize: 12,
          ),
      unselectedItemColor: Theme.of(context).colorScheme.outline,
      selectedItemColor: Theme.of(context).colorScheme.primaryFixedDim,
      onTap: (index) {
        if (widget.menuItems[index].onPressed != null) {
          widget.menuItems[index].onPressed!(context, ref);
        } else if (widget.menuItems[index].route != null) {
          context.goNamed(
            widget.menuItems[index].route!.name,
            pathParameters: widget.pathParameters ?? {},
          );
        }
      },
      items: widget.menuItems.mapIndexed(
        (index, item) {
          return BottomNavigationBarItem(
            icon: Stack(
              children: [
                item.svgIcon != null
                    ? SvgPicture.asset(
                        item.svgIcon!,
                        colorFilter: ColorFilter.mode(
                          _currentIndex == index
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
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
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
        },
      ).toList(),
    );
  }
}
