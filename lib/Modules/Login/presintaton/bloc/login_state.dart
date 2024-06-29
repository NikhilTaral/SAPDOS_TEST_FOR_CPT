
import 'package:equatable/equatable.dart';
import 'package:sopdas/Modules/Login/domin/responce/login_responce.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse response;

  const LoginSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}

class LoginError extends LoginState {
  final String ErrorMessage;
  const LoginError(this.ErrorMessage);
}


