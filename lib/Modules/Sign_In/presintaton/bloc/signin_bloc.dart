
import 'package:bloc/bloc.dart';
import 'package:sopdas/Modules/Sign_In/domin/usecases/signin_Usecase.dart';
import 'package:sopdas/Modules/Sign_In/presintaton/bloc/signin_state.dart';
import 'package:sopdas/Modules/Sign_In/presintaton/bloc/signin_event.dart';
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc(this.registerUseCase) : super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    try {
      await registerUseCase.execute(event.register);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}