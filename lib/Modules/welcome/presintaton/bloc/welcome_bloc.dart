
import 'package:bloc/bloc.dart';
import 'package:sopdas/Modules/welcome/presintaton/bloc/welcome_event.dart';
import 'package:sopdas/Modules/welcome/presintaton/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeInitial()) {
    on<WelcomeEvent>((event, emit) {
      on<SignUpButtonPressed>((event, emit) => emit(SignUpNavigate()));
      on<SignInButtonPressed>((event, emit) => emit(SignInNavigate()));
      on<GuestButtonPressed>((event, emit) => emit(GuestNavigate()));
    });
  }
}
