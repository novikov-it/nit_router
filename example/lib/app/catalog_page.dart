import 'package:example/router/router.dart';
import 'package:example/scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nit_router/nit_router.dart';

class CatalogPage extends ConsumerWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      pageTitle: 'Catalog Page',
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("From here you can go to a parameterized child page"),
            ...[1, 2, 3, 4, 5].map(
              (e) => TextButton(
                onPressed: () => context.goNamed(
                  AppNavigationZone.product.name,
                  pathParameters: AppNavigationParams.productId.set(e),
                ),
                child: Text(
                  "Go to product $e",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
