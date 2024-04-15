import 'package:get_it/get_it.dart';

import 'model/book.dart';
import 'model/loan.dart';
import 'model/user.dart';
import 'service/auth/auth_service.dart';
import 'service/generic_service.dart';

final service = GetIt.instance;

void setupService() {
  service.registerLazySingleton<AuthService>(() => AuthService());

  service.registerLazySingleton<GenericService<User>>(() => GenericService<User>());
  service.registerLazySingleton<GenericService<Loan>>(() => GenericService<Loan>());
  service.registerLazySingleton<GenericService<Book>>(() => GenericService<Book>());
}
