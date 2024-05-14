import '../model/book.dart';
import '../model/loan.dart';
import '../model/user.dart';
import '../repository/biblioteca_repository.dart'; 

class GenericService<T> {
  late dynamic repository;

  GenericService() {
    if (T == Book) {
      repository = BookRepository();
    } else if (T == Loan) {
      repository = LoanRepository();
    } else if (T == User) {
      repository = UserRepository();
    } else {
      throw Exception('Tipo não suportado');
    }
  }

  List<T> getAll() {
    if (T == Book) {
      return (repository as BookRepository).getAll() as List<T>;
    } else if (T == Loan) {
      return (repository as LoanRepository).getAll() as List<T>;
    } else if (T == User) {
      return (repository as UserRepository).getAll() as List<T>;
    } else {
      throw Exception('Tipo não suportado');
    }
  }

  T? get(int id) {
    try {
      if (T == Book) {
        return (repository as BookRepository).get(id) as T?;
      } else if (T == Loan) {
        return (repository as LoanRepository).get(id) as T?;
      } else if (T == User) {
        return (repository as UserRepository).get(id) as T?;
      } else {
        throw Exception('Tipo não suportado');
      }
    } catch (_) {
      return null;
    }
  }

  void add(T item) {
    if (T == Book) {
      (repository as BookRepository).save();
    } else if (T == Loan) {
      (repository as LoanRepository).save();
    } else if (T == User) {
      (repository as UserRepository).save();
    } else {
      throw Exception('Tipo não suportado');
    }
  }

  void update(T item) {
    if (T == Book) {
      (repository as BookRepository).update();
    } else if (T == Loan) {
      (repository as LoanRepository).update();
    } else if (T == User) {
      (repository as UserRepository).update();
    } else {
      throw Exception('Tipo não suportado');
    }
  }

  void remove(int id) {
    if (T == Book) {
      (repository as BookRepository).remove(id);
    } else if (T == Loan) {
      (repository as LoanRepository).remove(id);
    } else if (T == User) {
      (repository as UserRepository).remove(id);
    } else {
      throw Exception('Tipo não suportado');
    }
  }

  void clear() {
    if (T == Book) {
      (repository as BookRepository).clear();
    } else if (T == Loan) {
      (repository as LoanRepository).clear();
    } else if (T == User) {
      (repository as UserRepository).clear();
    } else {
      throw Exception('Tipo não suportado');
    }
  }

  int? get length {
    if (T == Book) {
      return (repository as BookRepository).length;
    } else if (T == Loan) {
      return (repository as LoanRepository).length;
    } else if (T == User) {
      return (repository as UserRepository).length;
    } else {
      throw Exception('Tipo não suportado');
    }
  }

  bool? get isEmpty {
    if (T == Book) {
      return (repository as BookRepository).isEmpty;
    } else if (T == Loan) {
      return (repository as LoanRepository).isEmpty;
    } else if (T == User) {
      return (repository as UserRepository).isEmpty;
    } else {
      throw Exception('Tipo não suportado');
    }
  }

  bool? get isNotEmpty {
    if (T == Book) {
      return (repository as BookRepository).isNotEmpty;
    } else if (T == Loan) {
      return (repository as LoanRepository).isNotEmpty;
    } else if (T == User) {
      return (repository as UserRepository).isNotEmpty;
    } else {
      throw Exception('Tipo não suportado');
    }
  }
}

