
import 'package:equatable/equatable.dart';
import 'package:sopdas/Modules/Sign_In/data/models/singin_module.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final Register register;

  const RegisterSubmitted(this.register);

  @override
  List<Object> get props => [register];
}
