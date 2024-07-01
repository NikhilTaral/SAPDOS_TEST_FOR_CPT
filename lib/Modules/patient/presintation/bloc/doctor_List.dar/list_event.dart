
import 'package:equatable/equatable.dart';

abstract class DoctorListEvent extends Equatable {
  const DoctorListEvent();

  @override
  List<Object> get props => [];
}

class FetchDoctorList extends DoctorListEvent {
  final String uId;

  const FetchDoctorList(this.uId);

  @override
  List<Object> get props => [uId];
}
