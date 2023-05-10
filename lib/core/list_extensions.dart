extension ListExtensions<T> on List<T> {
  List<List<T>> chunked(int size) {
    var chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(sublist(i, i + size > length ? length : i + size));
    }
    return chunks;
  }
}
