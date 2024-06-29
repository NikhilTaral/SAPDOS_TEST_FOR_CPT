import 'package:equatable/equatable.dart';

abstract class WelcomeState extends Equatable {
  const WelcomeState();

  @override
  List<Object> get props => [];
}

class WelcomeInitial extends WelcomeState {}

class SignUpNavigate extends WelcomeState {}

class SignInNavigate extends WelcomeState {}

class GuestNavigate extends WelcomeState {}
