Convenience wrapper for Go Router providing easy routes configuration, navigation parameters management, dynamic redirects and navigation bar

## Features
1. Configure routes with enums avoiding all boilerplate code and manual strings
2. Use navigation params with name and type to avoid any mistakes
3. Add dynamic redirects - depending on your state via Riverpod

## Getting started
Just add package to your dependencies
```bash
flutter pub add nit_router
```
Define navigation zones (will be covered below) and pass provider to your MaterialApp
```dart
return MaterialApp.router(
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
```
>ref.watch is used because of redirects provider which can depend on application state in order to handle updated redirects
## Usage

### Navigation Zones
The heart of nit_router are navigation zones - enums implementing NavigationZoneRoute. Below is a simple example with 2 top level routes and 1 child route with a parameter. This is enough to have everything working properly (without any code generation)
```dart
enum AppNavigationZone implements NavigationZoneRoute {
  home(
    SimpleNavigationRouteDescriptor(
      page: HomePage(),
    ),
  ),
  catalog(
    SimpleNavigationRouteDescriptor(
      page: CatalogPage(),
    ),
  ),
  product(
    ParameterizedNavigationRouteDescriptor(
      parameter: AppNavigationParams.productId,
      page: ProductPage(),
      parent: AppNavigationZone.catalog,
    ),
  );

  const AppNavigationZone(this.descriptor);

  @override
  final NavigationRouteDescriptor descriptor;

  @override
  String get root => '';
}
```
### Navigation Parameters
Navigation params are also configured with a enum which allows to secure type safety and easily track all usages of each parameter.
```dart
enum AppNavigationParams<T> with NavigationParamsMixin<T> {
  productId<int>();
}
```
With this you can easily pass parameter to routes
```dart
onPressed: () => context.goNamed(
  AppNavigationZone.product.name,
  pathParameters: AppNavigationParams.productId.set(e),
),
```
And access param on the destination page
```dart
final productId = ref.watchNavigationParam(
  AppNavigationParams.productId,
);
```
### Redirects
In order to setup redirects you only need to create a Provider<RedirectsStateModel> which will have all the routes inside and pass it to the nitRouterStateProvider params.
The example below shows redirects from auth zone to home screen if the user is signed in and from app zone to sign in screen if the user is not signed in.
```dart
final redirectsProvider = Provider<RedirectsStateModel>(
  (ref) {
    debugPrint("rebuilding redirects");

    if (ref.watch(
      authStateProvider.select(
        (state) => state.signedIn,
      ),
    )) {
      return RedirectsStateModel(
        redirects: Map.fromEntries(
          AuthNavigationZone.values.map(
            (e) => MapEntry(
              e,
              AppNavigationZone.home,
            ),
          ),
        ),
      );
    } else {
      return RedirectsStateModel(
        redirects: Map.fromEntries(
          AppNavigationZone.values.map(
            (e) => MapEntry(
              e,
              AuthNavigationZone.signIn,
            ),
          ),
        ),
      );
    }
  },
);
```

### Bottom Navigation Bar
Common task is to create a navigation bar with several icons and track which one is actually active. nit_router provides out of the box solution for this.
```dart
bottomNavigationBar: NitBottomNavigationBar(
        menuItems: [
          NitMenuItem(
            route: AppNavigationZone.home,
            displayTitle: 'Home',
            iconData: Icons.home,
          ),
          NitMenuItem(
            route: AppNavigationZone.catalog,
            displayTitle: 'Catalog',
            iconData: Icons.shop_2_sharp,
          ),
        ],
      ),
```
> NitBottomNavigationBar automatically determines which of the menu items should be highlighted as an active one.

## Further plans
1. Add Shell routes support
2. Add various page transition effects support
3. Add navigation bar styling and customization
