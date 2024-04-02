import 'package:shelf_plus/shelf_plus.dart';

import '../controller/auth_controller.dart';
import '../controller/generic_controller.dart';
import '../model/book.dart';
import '../model/loan.dart';
import '../model/user.dart';

class InternalRouter {
  RouterPlus router;
  late GenericController<User> userController;
  late GenericController<Loan> loanController;
  late GenericController<Book> bookController;
  late AuthController authController;

  InternalRouter({required this.router}) {
    userController = GenericController<User>(domain: 'user', router: router);
    loanController = GenericController<Loan>(domain: 'loan', router: router);
    bookController = GenericController<Book>(domain: 'book', router: router);

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

    userController.service.add(admin);

    var user = userController.service.get(1);
    print(user);
  }

  notFound(Request request) {
    return Response.notFound('Not found');
  }
}
