extension OptionalFirst<T> on Iterable<T> {
  T? get optionalFirst => isEmpty ? null : first;
}

extension OrDefault<T> on T? {
  T get orDefault {
    final value = this;
    if (value == null) {
      return {
        int: 0,
        String: '',
        double: 0.0,
        Map: {},
      }[T] as T;
    } else {
      return value;
    }
  }
}