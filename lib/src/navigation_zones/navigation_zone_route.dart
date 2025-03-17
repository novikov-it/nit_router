import 'package:nit_router/nit_router.dart';

abstract class NavigationZoneRoute implements Enum {
  final NavigationRouteDescriptor descriptor;

  NavigationZoneRoute(this.descriptor);

  String get root;
}

extension NavigationZoneRouteExtension on NavigationZoneRoute {
  String get name =>
      NitRouter.skipZoneInRouteNames ? toString().split('.').last : toString();

  String get _path => descriptor.path ?? toString().split('.').last;

  String get routePath =>
      '${descriptor.parent == null ? '/$root${root != '' && _path != '' ? '/' : ''}' : ''}$_path';

  String get fullPath => descriptor.parent == null
      ? routePath
      : '${descriptor.parent!.fullPath}/$_path';
}
