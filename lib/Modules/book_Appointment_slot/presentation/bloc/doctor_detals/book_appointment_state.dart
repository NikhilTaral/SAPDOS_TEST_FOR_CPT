
import 'package:sopdas/Modules/book_Appointment_slot/domin/entities/apply%20responce.dart';

class DoctorState {}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorLoaded extends DoctorState {
  final DoctorBooking doctor;

  DoctorLoaded(this.doctor);
}

class DoctorError extends DoctorState {
  final String message;

  DoctorError(this.message);
}
