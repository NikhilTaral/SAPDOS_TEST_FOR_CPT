
class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentSuccess extends AppointmentState {}

class AppointmentFailure extends AppointmentState {
  final String message;

  AppointmentFailure(this.message);
}