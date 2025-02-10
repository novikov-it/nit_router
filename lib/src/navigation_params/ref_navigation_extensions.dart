import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'navigation_parameters_providers.dart';
import 'navigation_params_mixin.dart';

extension WidgetRefNavigationExtension on WidgetRef {
  T? watchNavigationParam<T>(NavigationParamsMixin<T> param) => param.get(
        watch(navigationPathParametersProvider),
      );

  T? readNavigationParam<T>(NavigationParamsMixin<T> param) => param.get(
        read(navigationPathParametersProvider),
      );
}

extension RefNavigationExtension on Ref {
  T? watchNavigationParam<T>(NavigationParamsMixin<T> param) => param.get(
        watch(navigationPathParametersProvider),
      );

  T? readNavigationParam<T>(NavigationParamsMixin<T> param) => param.get(
        read(navigationPathParametersProvider),
      );
}
