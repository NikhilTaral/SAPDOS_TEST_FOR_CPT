import 'package:flutter/material.dart';
import 'package:sopdas/core/colors/colores.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarPopup extends StatefulWidget {
  final void Function(DateTime) onDateSelected;

  CalendarPopup({required this.onDateSelected});

  @override
  _CalendarPopupState createState() => _CalendarPopupState();
}

class _CalendarPopupState extends State<CalendarPopup> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String _selectedDateText = '';

  @override
  void initState() {
    super.initState();
    _selectedDateText = DateFormat('dd-MM-yyyy').format(_focusedDay);
  }

  void _showCalendarPopup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          height: 400,
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    _selectedDateText = DateFormat('dd-MM-yyyy').format(selectedDay);
                  });
                  widget.onDateSelected(selectedDay);
                  Navigator.pop(context);
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  outsideDaysVisible: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _showCalendarPopup,
          child: Card(
            color: AppColors.dark,
            child: SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDateText,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    const Icon(
                      Icons.calendar_month_sharp,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
