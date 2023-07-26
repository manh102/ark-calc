/// Extension method chunked for Iterable class to split a list into sublists of a certain size
extension ChunkExtension<T> on Iterable<T> {
  Iterable<List<T>> chunked(int size) sync* {
    List<T> chunk = [];
    for (T item in this) {
      chunk.add(item);
      if (chunk.length == size) {
        yield chunk;
        chunk = [];
      }
    }
    if (chunk.isNotEmpty) {
      yield chunk;
    }
  }
}

extension MapToList<T> on Iterable<T> {
  List<E> mapList<E>(E Function(T source) toElement) => map(toElement).toList();
}

extension IsNullOrEmptyList<T> on Iterable<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
