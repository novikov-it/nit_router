/// Mixin to add to enum to get params from navigation
///
/// Example usage:
/// ```dart
/// final params = ref.watch(paramsProvider); // Get params from provider
/// int id = MyMixedEnum.myMixedValue.get(params); // Get id from params
/// ```
mixin DefaultNavigationMixin<T> on Enum {
  T? get(Map<String, String> navigationParameters) {
    final String? value = navigationParameters[name];

    if (value == null) {
      return null;
    }

    switch (T) {
      case int:
        return int.parse(value) as T;

      default:
        try {
          return value as T;
        } on FormatException {
          throw UnimplementedError(
            'Type $T is not implemented for navigation',
          );
        }
    }
  }
}
