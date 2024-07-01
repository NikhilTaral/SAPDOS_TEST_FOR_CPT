import 'package:equatable/equatable.dart';
import 'package:sopdas/Modules/payment/data/models/booking_model.dart';

abstract class AppointmentEvent extends Equatable {
  const AppointmentEvent();

  @override
  List<Object?> get props => [];
}

class BookAppointmentEvent extends AppointmentEvent {
  final AppointmentRequest request;

  const BookAppointmentEvent(this.request);

  @override
  List<Object?> get props => [request];
}
