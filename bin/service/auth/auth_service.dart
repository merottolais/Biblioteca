import '../../model/user.dart';
import '../../repository/generic_repository.dart';
import 'token.dart';

class AuthService {
  late Token token;

  AuthService() {
    token = Token();
  }

  login(String email, String password) {
    User? user = _getUserByEmail(email);

    if (user == null) {
      throw Exception('Invalid email or password');
    }

    if (user.password != password) {
      throw Exception('Invalid email or password');
    }

    return token.generateToken(email);
  }

  User? _getUserByEmail(String email) {
    GenericRepository<User> repository = GenericRepository<User>();
    List<User> users = repository.getAll();
    return users.singleWhere((element) => element.email == email);
  }
}
