import 'package:equatable/equatable.dart';
import 'package:sopdas/Modules/patient/data/models/Doctor_List_model.dart';

abstract class DoctorListState extends Equatable {
  const DoctorListState();

  @override
  List<Object> get props => [];
}

class DoctorListInitial extends DoctorListState {}

class DoctorListLoading extends DoctorListState {}

class DoctorListLoaded extends DoctorListState {
  final DoctorListModel doctorList;

  const DoctorListLoaded(this.doctorList);

  @override
  List<Object> get props => [doctorList];
}

class DoctorListError extends DoctorListState {
  final String message;

  const DoctorListError(this.message);

  @override
  List<Object> get props => [message];
}
