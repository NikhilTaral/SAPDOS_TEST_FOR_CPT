import 'package:flutter/material.dart';
import 'package:sopdas/Modules/book_Appointment_slot/data/models/slot_booking.dart';
import 'package:sopdas/core/colors/colores.dart';
class TimeSlotGrid extends StatelessWidget {
  final List<TimeSlot> timeSlots;
  final String? selectedSlot;
  final void Function(String?) onSlotSelected;

  const TimeSlotGrid({
    Key? key,
    required this.timeSlots,
    required this.selectedSlot,
    required this.onSlotSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width < 600 ? 1 : 3,
        childAspectRatio: 8,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
      ),
      itemCount: timeSlots.length,
      itemBuilder: (context, index) {
        final slot = timeSlots[index];
        return Container(
          color: AppColors.light,
          child: GridTile(
            child: ListTile(
              title: Text(
                slot.time,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              leading: Radio<String?>(
                value: slot.time,
                groupValue: selectedSlot,
                onChanged: onSlotSelected,
              ),
            ),
          ),
        );
      },
    );
  }
}