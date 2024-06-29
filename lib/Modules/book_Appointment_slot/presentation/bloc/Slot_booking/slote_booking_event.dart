
import 'package:equatable/equatable.dart';

abstract class TimeSlotEvent extends Equatable {
  const TimeSlotEvent();

  @override
  List<Object?> get props => [];
}

class FetchTimeSlots extends TimeSlotEvent {
  final dynamic doctorId;
  final String date;

  const FetchTimeSlots(this.doctorId, this.date);

  @override
  List<Object?> get props => [doctorId, date];
}

class SelectTimeSlot extends TimeSlotEvent {
  final dynamic selectedSlot;

  const SelectTimeSlot(this.selectedSlot);

  @override
  List<Object?> get props => [selectedSlot];
}
