extension Find<K, V, R> on Map<K, V> {
  R? find<T>(
      K key,
      R? Function(T value) cast,
      ) {
    if (!this.containsKey(key)) {
      return null;
    }
    final value = this[key];
    if (value != null && value is T) {
      return cast(value as T);
    } else {
      return null;
    }
  }
}

extension DetailedWhere<K, V> on Map<K, V> {
  Map<K, V> where(bool Function(K key, V value) f) => Map<K, V>.fromEntries(
    entries.where((entry) => f(entry.key, entry.value)),
  );

  Map<K, V> whereKey(bool Function(K key) f) =>
      {...where((key, value) => f(key))};

  Map<K, V> whereValue(bool Function(V value) f) =>
      {...where((key, value) => f(value))};
}

extension DetailedMap<K, V> on Map<K, V> {
  Map<R, V> mappedKeys<R>(R Function(K) f) =>
      map((key, value) => MapEntry(f(key), value));

  Map<K, R> mappedValues<R>(R Function(V) f) =>
      map((key, value) => MapEntry(key, f(value)));
}

extension Merge<K, V> on Map<K, V> {
  Map<K, V> operator |(Map<K, V> other) => {...this}..addEntries(
    other.entries,
  );
}

extension AddOperator<K, V> on Map<K, V> {
  Map<K, V> operator +(Map<K, V> other) => {...this}..addAll(other);
}

extension MapIfOfType<T> on T {
  R? mapIfOfType<E, R>(R Function(E) f) {
    final self = this;
    if (self is E) {
      return f(self);
    } else {
      return null;
    }
  }
}