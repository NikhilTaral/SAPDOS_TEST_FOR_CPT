import 'package:equatable/equatable.dart';
import 'package:sopdas/Modules/book_Appointment_slot/data/models/slot_booking.dart';

abstract class TimeSlotState extends Equatable {
  const TimeSlotState();

  @override
  List<Object?> get props => [];
}

class TimeSlotInitial extends TimeSlotState {}

class TimeSlotLoading extends TimeSlotState {}

class TimeSlotLoaded extends TimeSlotState {
  final List<TimeSlot> timeSlots;
  final String? selectedSlot;

  const TimeSlotLoaded(this.timeSlots, {this.selectedSlot});

  @override
  List<Object?> get props => [timeSlots, selectedSlot];
}

class TimeSlotError extends TimeSlotState {
  final String message;

  const TimeSlotError(this.message);

  @override
  List<Object?> get props => [message];
}
