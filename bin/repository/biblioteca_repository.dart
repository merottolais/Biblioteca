// biblioteca_repository
import '../model/book.dart';
import '../model/loan.dart';
import '../model/user.dart';
import 'database_repository.dart';

class BookRepository extends Database {
  int? get length => null;

  bool? get isEmpty => null;

  bool? get isNotEmpty => null;

  Future<void> init() async {
    await initDatabase();
    await _createTable();
  }

  Future<void> _createTable() async {
    if (await _tableExists()) {
      return;
    }
    await connection.query('''
      CREATE TABLE book (
        id INT NOT NULL AUTO_INCREMENT,
        title VARCHAR(100) NOT NULL,
        author VARCHAR(100) NOT NULL,
        description TEXT NOT NULL,
        imageUrl TEXT,
        PRIMARY KEY (id)
      )
    ''');
  }

  Future<bool> _tableExists() async {
    var result = await connection.query('SHOW TABLES LIKE "book"');
    return result.isNotEmpty;
  }

  Book getSelf() {
    return this as Book;
  }

  Future<void> save() async {
    if (!isInitialized) {
      await init();
    }

    await connection.query('''
      INSERT INTO book (title, author, description, imageUrl)
      VALUES (?, ?, ?, ?)
    ''', [getSelf().title, getSelf().author, getSelf().description, getSelf().imageUrl]);
  }

  Future<void> update() async {
    if (!isInitialized) {
      await init();
    }

    await connection.query('''
      UPDATE book
      SET title = ?, author = ?, description = ?, imageUrl = ?
      WHERE id = ?
    ''', [getSelf().title, getSelf().author, getSelf().description, getSelf().imageUrl, getSelf().id]);
  }

  Future<List<Book>> getAll() async {
    if (!isInitialized) {
      await init();
    }

    var result = await connection.query('SELECT * FROM book');
    return result
        .map((e) => Book(title: '', author: '', description: '')
          ..id = e[0]
          ..title = e[1].toString()
          ..author = e[2].toString()
          ..description = e[3].toString()
          ..imageUrl = e[4].toString())
        .toList();
  }

  Future<Book?> get(int id) async {
    if (!isInitialized) {
      await init();
    }

    var result = await connection.query('SELECT * FROM book WHERE id = ?', [id]);

    if (result.isEmpty) {
      return null;
    }

    return result
        .map((e) => Book(title: '', author: '', description: '')
          ..id = e[0]
          ..title = e[1].toString()
          ..author = e[2].toString()
          ..description = e[3].toString()
          ..imageUrl = e[4].toString())
        .first;
  }

  void remove(int id) {}

  void clear() {}
}

class LoanRepository extends Database {
  int? get length => null;

  bool? get isEmpty => null;

  bool? get isNotEmpty => null;

  Future<void> init() async {
    await initDatabase();
    await _createTable();
  }

  Future<void> _createTable() async {
    if (await _tableExists()) {
      return;
    }
    await connection.query('''
      CREATE TABLE loan (
        id INT NOT NULL AUTO_INCREMENT,
        bookId INT,
        userId INT,
        PRIMARY KEY (id),
        FOREIGN KEY (bookId) REFERENCES book(id),
        FOREIGN KEY (userId) REFERENCES user(id)
      )
    ''');
  }

  Future<bool> _tableExists() async {
    var result = await connection.query('SHOW TABLES LIKE "loan"');
    return result.isNotEmpty;
  }

  Loan getSelf() {
    return this as Loan;
  }

  Future<void> save() async {
    if (!isInitialized) {
      await init();
    }

    await connection.query('''
      INSERT INTO loan (bookId, userId)
      VALUES (?, ?)
    ''', [getSelf().book!.id, getSelf().user!.id]);
  }

  Future<void> update() async {
    if (!isInitialized) {
      await init();
    }

    await connection.query('''
      UPDATE loan
      SET bookId = ?, userId = ?
      WHERE id = ?
    ''', [getSelf().book!.id, getSelf().user!.id, getSelf().id]);
  }

  Future<List<Loan>> getAll() async {
    if (!isInitialized) {
      await init();
    }

    var result = await connection.query('SELECT * FROM loan');
    return result
        .map((e) => Loan()
          ..id = e[0]
          ..bookId = e[1] as int?
          ..userId = e[2] as int?)
        .toList();
  }

  Future<Loan?> get(int id) async {
    if (!isInitialized) {
      await init();
    }

    var result = await connection.query('SELECT * FROM loan WHERE id = ?', [id]);

    if (result.isEmpty) {
      return null;
    }

    return result
        .map((e) => Loan()
          ..id = e[0]
          ..bookId = e[1] as int?
          ..userId = e[2] as int?)
        .first;
  }

  void remove(int id) {}

  void clear() {}
}

class UserRepository extends Database {
  int? get length => null;

  bool? get isEmpty => null;

  bool? get isNotEmpty => null;

  Future init() async {
    await initDatabase();
    await _createTable();
  }

  Future<void> _createTable() async {
    if (await _tableExists()) {
      return;
    }
    await connection.query('''
      CREATE TABLE user (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL,
        password VARCHAR(255) NOT NULL,
        type VARCHAR(50) NOT NULL,
        PRIMARY KEY (id)
      )
    ''');
  }

  Future<bool> _tableExists() async {
    var result = await connection.query('SHOW TABLES LIKE "user"');
    return result.isNotEmpty;
  }

  User getSelf() {
    return this as User;
  }

  Future<void> save() async {
    if (!isInitialized) {
      await init();
    }

    await connection.query('''
      INSERT INTO user (name, email, password, type)
      VALUES (?, ?, ?, ?)
    ''', [getSelf().name, getSelf().email, getSelf().password, getSelf().type]);
  }

  Future<void> update() async {
    if (!isInitialized) {
      await init();
    }

    await connection.query('''
      UPDATE user
      SET name = ?, email = ?, password = ?, type = ?
      WHERE id = ?
    ''', [getSelf().name, getSelf().email, getSelf().password, getSelf().type, getSelf().id]);
  }

  Future<List<User>> getAll() async {
    if (!isInitialized) {
      await init();
    }

    var result = await connection.query('SELECT * FROM user');
    return result
        .map((e) => User(name: '', email: '', password: '', type: '')
          ..id = e[0]
          ..name = e[1].toString()
          ..email = e[2].toString()
          ..password = e[3].toString()
          ..type = e[4].toString())
        .toList();
  }

  Future<User?> get(int id) async {
    if (!isInitialized) {
      await init();
    }

    var result = await connection.query('SELECT * FROM user WHERE id = ?', [id]);

    if (result.isEmpty) {
      return null;
    }

    return result
        .map((e) => User(name: '', email: '', password: '', type: '')
          ..id = e[0]
          ..name = e[1].toString()
          ..email = e[2].toString()
          ..password = e[3].toString()
          ..type = e[4].toString())
        .first;
  }

  void remove(int id) {}

  void clear() {}
}

