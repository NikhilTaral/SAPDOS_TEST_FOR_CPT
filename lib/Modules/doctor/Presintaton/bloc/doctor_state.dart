

import 'package:equatable/equatable.dart';
import 'package:sopdas/Modules/doctor/data/models/Doctor_Dashbord_module.dart';
import 'package:sopdas/Modules/doctor/data/models/doctor_model.dart';


abstract class DoctorState extends Equatable {
  const DoctorState();

  @override
  List<Object> get props => [];
}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorLoaded extends DoctorState {
  final Doctor doctor;

  final DoctorDashbord doctorDashboard;

  const DoctorLoaded(this.doctor, this.doctorDashboard);

  @override
  List<Object> get props => [doctor];
}


class DoctorError extends DoctorState {
  final String message;

  const DoctorError(this.message);

  @override
  List<Object> get props => [message];
}






abstract class DoctorDashboardState extends Equatable {
  const DoctorDashboardState();

  @override
  List<Object> get props => [];
}

class DoctorDashboardInitial extends DoctorDashboardState {}

class DoctorDashboardLoading extends DoctorDashboardState {}

class DoctorDashboardLoaded extends DoctorDashboardState {
  final DoctorDashbord dashboard;

  const DoctorDashboardLoaded({required this.dashboard});

  @override
  List<Object> get props => [dashboard];
}

class DoctorDashboardError extends DoctorDashboardState {
  final String message;

  const DoctorDashboardError({required this.message});

  @override
  List<Object> get props => [message];
}
