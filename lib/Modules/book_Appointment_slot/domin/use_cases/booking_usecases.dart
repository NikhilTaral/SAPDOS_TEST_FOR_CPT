import 'package:sopdas/Modules/book_Appointment_slot/domin/entities/apply%20responce.dart';
import 'package:sopdas/Modules/book_Appointment_slot/domin/responce/responce.dart';
class FetchDoctorByUId {
  final DoctorRepository repository;

  FetchDoctorByUId(this.repository);

  Future<DoctorBooking?> execute(String uId) {
    return repository.fetchDoctorByUId(uId);
  }
}
