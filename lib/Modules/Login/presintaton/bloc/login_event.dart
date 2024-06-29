import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginTextChange extends LoginEvent {
  final  userName;
  final password;
  const LoginTextChange(this.userName, this.password);
}

class LoginSubmitted extends LoginEvent {
  final userName;
  final password;

  const LoginSubmitted(this.userName, this.password);

  @override
  List<Object> get props => [userName, password];
}
