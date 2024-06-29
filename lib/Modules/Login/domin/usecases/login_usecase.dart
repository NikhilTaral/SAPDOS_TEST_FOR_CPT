
import 'package:sopdas/Modules/Login/data/models/login_module.dart';
import 'package:sopdas/Modules/Login/data/repositories/login_repo.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future execute(Login login) {
    return authRepository.login(login);
  }
}
