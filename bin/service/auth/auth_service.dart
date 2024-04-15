import '../../model/user.dart';
import '../../register.dart';
import '../generic_service.dart';
import 'token.dart';

class AuthService {
  late Token token;

  AuthService() {
    token = Token();
  }

  String login(String email, String password) {
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
    List<User> users = service<GenericService<User>>().getAll();
    return users.singleWhere((element) => element.email == email);
  }
}
