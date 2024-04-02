import '../repository/generic_repository.dart';

class GenericService<T> {
  late GenericRepository<T> repository;

  GenericService() {
    repository = GenericRepository<T>();
  }

  List<T> getAll() {
    return repository.getAll();
  }

  T get(int id) {
    return repository.get(id);
  }

  void add(T item) {
    repository.add(item);
  }

  void update(T item) {
    repository.update(item);
  }

  void remove(int id) {
    repository.remove(id);
  }

  void clear() {
    repository.clear();
  }

  int get length => repository.length;
  bool get isEmpty => repository.isEmpty;
  bool get isNotEmpty => repository.isNotEmpty;
}
