part of '../router.dart';

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
