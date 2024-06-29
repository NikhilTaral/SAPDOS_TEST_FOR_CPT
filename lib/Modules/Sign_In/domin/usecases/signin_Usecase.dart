
import 'package:sopdas/Modules/Sign_In/data/models/singin_module.dart';
import 'package:sopdas/Modules/Sign_In/data/repositories/signin_repo.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  Future<void> execute(Register registe) {
    return authRepository.register(registe);
  }
}
