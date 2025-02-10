import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nit_router/nit_router.dart';

class AppScaffold extends ConsumerWidget {
  const AppScaffold({
    super.key,
    required this.pageTitle,
    required this.body,
  });

  final String pageTitle;
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      bottomNavigationBar: NitBottomNavigationBar(
        menuItems: [
          NitMenuItem(
            route: AppNavigationZone.home,
            displayTitle: 'Home',
            iconData: Icons.home,
          ),
          NitMenuItem(
            route: AppNavigationZone.catalog,
            displayTitle: 'Catalog',
            iconData: Icons.shop_2_sharp,
          ),
        ],
      ),
      body: body,
    );
  }
}
