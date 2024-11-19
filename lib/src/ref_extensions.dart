import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'navigation/default_navigation_mixin.dart';
import 'providers.dart';

extension WidgetRefNavigationExtension on WidgetRef {
  T? watchNavigationParam<T>(DefaultNavigationMixin<T> param) => param.get(
        watch(navigationPathParametersProvider),
      );

  T? readNavigationParam<T>(DefaultNavigationMixin<T> param) => param.get(
        read(navigationPathParametersProvider),
      );
}

extension RefNavigationExtension on Ref {
  T? watchNavigationParam<T>(DefaultNavigationMixin<T> param) => param.get(
        watch(navigationPathParametersProvider),
      );

  T? readNavigationParam<T>(DefaultNavigationMixin<T> param) => param.get(
        read(navigationPathParametersProvider),
      );
}
