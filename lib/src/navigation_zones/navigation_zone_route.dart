import 'navigation_route_descriptor.dart';

abstract class NavigationZoneRoute implements Enum {
  final NavigationRouteDescriptor descriptor;

  NavigationZoneRoute(this.descriptor);

  String get root;
}

extension NavigationZoneRouteExtension on NavigationZoneRoute {
  String get _path => descriptor.path ?? name;

  String get routePath =>
      '${descriptor.parent == null ? '/$root${root != '' && _path != '' ? '/' : ''}' : ''}$_path';

  String get fullPath => descriptor.parent == null
      ? routePath
      : '${descriptor.parent!.fullPath}/$_path';
}
