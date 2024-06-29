import 'package:equatable/equatable.dart';
import 'package:sopdas/Modules/patient/data/models/patient_model.dart';

abstract class PatientState extends Equatable {
  const PatientState();

  @override
  List<Object> get props => [];
}

class PatientInitial extends PatientState {}

class PatientLoading extends PatientState {}

class PatientLoaded extends PatientState {
  final PatientModel patient;

  const PatientLoaded(this.patient);

  @override
  List<Object> get props => [patient];
}

class PatientError extends PatientState {
  final String message;

  const PatientError(this.message);

  @override
  List<Object> get props => [message];
}

// class ApiLoaded extends PatientState {
//   final ApiModel apiModel;

//   const ApiLoaded({required this.apiModel});

//   @override
//   List<Object> get props => [apiModel];
// }
