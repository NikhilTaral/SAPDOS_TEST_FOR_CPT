import 'package:sopdas/Modules/book_Appointment_slot/domin/entities/apply%20responce.dart';

abstract class DoctorRepository {
  Future<DoctorBooking> fetchDoctorByUId(String uId);

  fetchDoctorDashboard(String s, String formattedDate) {}
}
