import 'package:equatable/equatable.dart';

abstract class WelcomeEvent extends Equatable {
  const WelcomeEvent();

  @override
  List<Object> get props => [];
}

class SignUpButtonPressed extends WelcomeEvent {}

class SignInButtonPressed extends WelcomeEvent {}

class GuestButtonPressed extends WelcomeEvent {}
