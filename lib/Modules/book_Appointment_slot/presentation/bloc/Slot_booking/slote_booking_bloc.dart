import 'package:bloc/bloc.dart';
import 'package:sopdas/Modules/book_Appointment_slot/domin/responce/slot_repositry.dart';
import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/Slot_booking/slote_booking_event.dart';
import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/Slot_booking/slote_booking_state.dart';

class TimeSlotBloc extends Bloc<TimeSlotEvent, TimeSlotState> {
  final TimeSlotRepository repository;

  TimeSlotBloc(this.repository) : super(TimeSlotInitial()) {
    on<FetchTimeSlots>((event, emit) async {
      emit(TimeSlotLoading());
      try {
        final slots = await repository.getAvailableSlots(event.doctorId, event.date);
        emit(TimeSlotLoaded(slots));
      } catch (e) {
        emit(const TimeSlotError('Failed to fetch time slots'));
      }
    });

    on<SelectTimeSlot>((event, emit) {
      if (state is TimeSlotLoaded) {
        emit(TimeSlotLoaded(
          (state as TimeSlotLoaded).timeSlots,
          selectedSlot: event.selectedSlot,
        ));
      }
    });
  }
}
