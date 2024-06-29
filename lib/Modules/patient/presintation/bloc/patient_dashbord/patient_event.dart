import 'package:equatable/equatable.dart';

abstract class PatientEvent extends Equatable {
  const PatientEvent();

  @override
  List<Object> get props => [];
}

class GetPatient extends PatientEvent {
  final dynamic uId;

  const GetPatient(this.uId);

  @override
  List<Object> get props => [uId];
}
