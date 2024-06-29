
import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:sopdas/Modules/Login/data/models/login_module.dart';
import 'package:sopdas/Modules/Login/domin/usecases/login_usecase.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginTextChange>((LoginEventevent, emit) {
      if (EmailValidator.validate(LoginEventevent.userName) == false) {
        emit(const LoginError("Enter a valid userName and address"));
      } else if (LoginEventevent.password.length < 7) {
        emit(const LoginError("Enter a Valid Password"));
      } else {
        emit(LoginLoading());
      }
      
    });
    @override
    Stream<LoginState> mapEventToState(
      LoginEvent event,
    ) async* {
      if (event is LoginSubmitted) {
        yield LoginLoading();
        try {
          final login =
              Login(userName: event.userName, password: event.password);
          final response = await loginUseCase.execute(login);
          yield LoginSuccess(response);
        } catch (e) {
          yield LoginFailure(e.toString());
        }
      }
    }
  }
  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final login = Login(userName: event.userName, password: event.password);
      final response = await loginUseCase.execute(login);
      emit(LoginSuccess(response));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}

