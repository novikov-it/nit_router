import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
Map<String, String> navigationPathParameters(NavigationPathParametersRef ref) {
  return const {};
}

@Riverpod(dependencies: [])
Object? navigationExtraParameter(NavigationExtraParameterRef ref) {
  return null;
}

// @Riverpod(dependencies: [])
// Raw<NitRouter> router(RouterRef ref) {
//   throw UnimplementedError(
//     'Router was not initialized. To initialize router, use NitApp class.',
//   );
// }
