

import 'package:equatable/equatable.dart';

abstract class DoctorEvent extends Equatable {
  const DoctorEvent();

  @override
  List<Object> get props => [];
}

class GetDoctor extends DoctorEvent {
  final dynamic uId;

  const GetDoctor(this.uId);

  @override
  List<Object> get props => [uId];
}




abstract class DoctorDashboardEvent extends Equatable {
  const DoctorDashboardEvent();

  @override
  List<Object> get props => [];
}

class FetchDoctorDashboard extends DoctorDashboardEvent {
  final String uId;
  final String date;

  const FetchDoctorDashboard({required this.uId, required this.date});

  @override
  List<Object> get props => [uId, date];
}
