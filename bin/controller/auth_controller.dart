import 'package:shelf_multipart/form_data.dart';
import 'package:shelf_plus/shelf_plus.dart';
import '../register.dart';
import '../service/auth/auth_service.dart';

class AuthController {
  RouterPlus router;

  AuthController({required this.router}) {
    router.post('/login', login);
  }

  Future<Response> login(Request request) async {
    final parameters = <String, String>{
      await for (final formData in request.multipartFormData) formData.name: await formData.part.readString(),
    };

    final email = parameters['email'];
    final password = parameters['password'];

    if (email == null || password == null) {
      return Response.badRequest(body: 'Email and password are required');
    }

    try {
      final token = service<AuthService>().login(email, password);
      return Response.ok(token);
    } catch (e) {
      return Response.forbidden(e);
    }
  }
}
