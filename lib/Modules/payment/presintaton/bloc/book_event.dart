import 'package:sopdas/Modules/payment/data/models/booking_model.dart';

class AppointmentEvent {}

class BookAppointmentEvent extends AppointmentEvent {
  final AppointmentRequest request;

  BookAppointmentEvent(this.request);
}