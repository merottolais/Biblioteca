import 'package:shelf_plus/shelf_plus.dart';
import 'package:shelf/shelf_io.dart' as io;

import 'register.dart';
import 'router/internal_router.dart';

void main() async {
  var app = Router().plus;

  InternalRouter(router: app);
  setupService();

  var server = await io.serve(app.call, 'localhost', 8080);

  print('Server running on localhost:${server.port}');
}
