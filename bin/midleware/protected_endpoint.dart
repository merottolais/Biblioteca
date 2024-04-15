import 'package:shelf_plus/shelf_plus.dart';

import '../register.dart';
import '../service/auth/auth_service.dart';

class ProtectedEndpoint {
  isAuthorized(Request request) {
    final authorization = request.headers['authorization'];

    if (authorization == null) {
      throw Exception('Missing authorization header');
    }

    if (!service<AuthService>().token.isValid(authorization)) {
      throw Exception('Invalid token');
    }
  }
}
