import 'package:example/auth/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nit_router/nit_router.dart';

import '../app/catalog_page.dart';
import '../app/home_page.dart';
import '../app/product_page.dart';
import '../auth/sign_in_page.dart';

part 'navigation_zones/app_navigation_zone.dart';
part 'navigation_zones/auth_navigation_zone.dart';
part 'redirects/redirects_provider.dart';

enum AppNavigationParams<T> with NavigationParamsMixin<T> {
  productId<int>();
}
