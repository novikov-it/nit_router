import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nit_router/nit_router.dart';

import '../scaffold/app_scaffold.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productId = ref.watchNavigationParam(
      AppNavigationParams.productId,
    );

    return AppScaffold(
      pageTitle: 'Product #$productId',
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Product ID has been passed via path parameter and is accessible with ref.watchNavigationParam",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
              onPressed: () => context.pop(),
              child: const Text('Back to catalog'),
            ),
          ],
        ),
      ),
    );
  }
}
