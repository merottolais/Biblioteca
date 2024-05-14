import 'package:shelf_plus/shelf_plus.dart';
import '../controller/auth_controller.dart';
import '../controller/biblioteca_controller.dart';
import '../model/book.dart';
import '../model/loan.dart';
import '../model/user.dart';
import '../register.dart';
import '../service/generic_service.dart';

class InternalRouter {
  RouterPlus router;
  late BibliotecaController<User> userController;
  late BibliotecaController<Loan> loanController;
  late BibliotecaController<Book> bookController;
  late AuthController authController;

  InternalRouter({required this.router}) {
    userController = BibliotecaController<User>(domain: 'user', router: router);
    loanController = BibliotecaController<Loan>(domain: 'loan', router: router);
    bookController = BibliotecaController<Book>(domain: 'book', router: router);

    authController = AuthController(router: router);

    bootstrap();

    router.all('/<ignored|.*>', notFound);
  }

  bootstrap() {
    User admin = User();

    admin.id = 1;
    admin.name = 'Admin';
    admin.email = 'admin@admin.com';
    admin.password = 'admin';
    admin.type = 'admin';

    service<GenericService<User>>().add(admin);
  }

  notFound(Request request) {
    return Response.notFound('Not found');
  }
}
