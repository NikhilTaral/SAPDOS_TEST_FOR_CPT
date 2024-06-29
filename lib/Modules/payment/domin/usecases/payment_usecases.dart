// lib/domain/usecases/book_appointment_usecase.dart
import 'package:sopdas/Modules/payment/data/models/booking_model.dart';
import 'package:sopdas/Modules/payment/domin/repositories/appintment_repo.dart';

class BookAppointmentUseCase {
  final AppointmentRepository repository;

  BookAppointmentUseCase(this.repository);

  Future<void> execute(AppointmentRequest request) {
    return repository.bookAppointment(request);
  }
}
