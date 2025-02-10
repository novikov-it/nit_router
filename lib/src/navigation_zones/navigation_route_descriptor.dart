import 'package:flutter/material.dart';
import '../navigation_params/navigation_params_mixin.dart';
import 'navigation_zone_route.dart';

abstract class NavigationRouteDescriptor {
  const NavigationRouteDescriptor({
    required this.page,
    this.path,
    this.parent,
  });

  final Widget page;
  final String? path;
  final NavigationZoneRoute? parent;
}

class SimpleNavigationRouteDescriptor extends NavigationRouteDescriptor {
  const SimpleNavigationRouteDescriptor({
    required super.page,
    super.parent,
  });
}

class ParameterizedNavigationRouteDescriptor<ParameterType>
    extends NavigationRouteDescriptor {
  static const String parameterSubstitutionPattern =
      'parameterSubstitutionPattern';

  const ParameterizedNavigationRouteDescriptor({
    required super.page,
    required this.parameter,
    super.parent,
    this.pathSegmentTemplate = parameterSubstitutionPattern,
  });
  final NavigationParamsMixin<ParameterType> parameter;
  final String pathSegmentTemplate;

  @override
  String get path => pathSegmentTemplate.replaceFirst(
        parameterSubstitutionPattern,
        ':${parameter.name}',
      );
}
