
// lib/data/repositories/appointment_repository_impl.dart
import 'package:sopdas/Modules/payment/data/models/booking_model.dart';
import 'package:sopdas/Modules/payment/data/repositories/payment_repo_imp.dart';
import 'package:sopdas/Modules/payment/domin/repositories/appintment_repo.dart';

class  AppointmentDataSource implements AppointmentRepository {
  final AppointmentRepositoryImpl dataSource;

  AppointmentDataSource(this.dataSource);

  @override
  Future<void> bookAppointment(AppointmentRequest request) {
    return dataSource.bookAppointment(request);
  }
}


