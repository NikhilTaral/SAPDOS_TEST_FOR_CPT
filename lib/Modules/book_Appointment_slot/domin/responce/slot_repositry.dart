import 'package:sopdas/Modules/book_Appointment_slot/data/models/slot_booking.dart';
import 'package:sopdas/Modules/book_Appointment_slot/data/repositories/Slot_bookin_API.dart';

class TimeSlotRepository {
  final ApiProvider apiProvider;

  TimeSlotRepository(this.apiProvider);

  Future<List<TimeSlot>> getAvailableSlots(String doctorId, dynamic date) {
    return apiProvider.fetchAvailableSlots(
      doctorId,date
    );
  }
}
