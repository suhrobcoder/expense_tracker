extension MapExtensions<K, V> on Map<K, List<V>> {
  List<dynamic> expand() {
    final result = [];
    for (var key in keys) {
      result.add(key);
      result.addAll(this[key]?.toList() ?? []);
    }
    return result;
  }
}
