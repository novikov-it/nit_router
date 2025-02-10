mixin NavigationParamsMixin<T> on Enum {
  T? get(Map<String, String> navigationParameters) {
    final String? value = navigationParameters[name];

    if (value == null) {
      return null;
    }

    switch (T) {
      case const (int):
        return int.parse(value) as T;
      case const (String):
        return value as T;

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

  Map<String, String> set(T value) => {
        name: value.toString(),
      };
}
