import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nit_router/nit_router.dart';
import 'router/router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Nit Router Demo',
      routerConfig: ref.watch(
        nitRouterStateProvider(
          navigationZones: [
            AuthNavigationZone.values,
            AppNavigationZone.values,
          ],
          redirectsProvider: redirectsProvider,
        ),
      ),
    );
  }
}
