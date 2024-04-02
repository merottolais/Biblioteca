import 'package:get_it/get_it.dart';

import 'service/auth/auth_service.dart';

final service = GetIt.instance;

void setupService() {
  service.registerLazySingleton<AuthService>(() => AuthService());
}
