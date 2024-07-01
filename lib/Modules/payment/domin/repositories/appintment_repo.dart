import 'package:sopdas/Modules/payment/data/models/booking_model.dart';

abstract class AppointmentRepository {
  Future<void> bookAppointment(AppointmentRequest appointment);
}

class MockAppointmentRepository implements AppointmentRepository {
  @override
  Future<void> bookAppointment(AppointmentRequest appointment) async {
   
   
  }
}
