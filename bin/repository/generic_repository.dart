class GenericRepository<T> {
  final List<T> _items = [];

  void add(T item) {
    _items.add(item);
  }

  T get(int id) {
    return _items.firstWhere((element) => (element as dynamic).id == id);
  }

  List<T> getAll() {
    return _items;
  }

  void remove(int id) {
    _items.removeWhere((element) => (element as dynamic).id == id);
  }

  void update(T item) {
    final index = _items.indexWhere((element) => (element as dynamic).id == (item as dynamic).id);
    _items[index] = item;
  }

  void clear() {
    _items.clear();
  }

  int get length => _items.length;
  bool get isEmpty => _items.isEmpty;
  bool get isNotEmpty => _items.isNotEmpty;
}
