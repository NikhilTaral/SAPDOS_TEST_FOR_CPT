import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/Slot_booking/slote_booking_bloc.dart';
import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/Slot_booking/slote_booking_event.dart';
import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/Slot_booking/slote_booking_state.dart';
import 'package:sopdas/Modules/book_Appointment_slot/presentation/wigets/loding.dart';
import 'package:sopdas/Modules/book_appointment_slot/presentation/wigets/profile.dart';
import 'package:sopdas/Modules/book_appointment_slot/presentation/wigets/time_slot.dart';
import 'package:sopdas/Modules/patient/data/models/Doctor_List_model.dart';
import 'package:sopdas/Modules/patient/data/models/patient_model.dart';
import 'package:sopdas/Modules/payment/presintaton/pages/next.dart';
import 'package:sopdas/core/colors/colores.dart';

class AppointmentScreen extends StatefulWidget {
  final Doctor doctor;
  final String selectedSlot;
  final PatientModel patientUId;

  const AppointmentScreen({
    Key? key,
    required this.doctor,
    required this.selectedSlot,
    required this.patientUId,
  }) : super(key: key);

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfileSection(doctor: widget.doctor),
            const SizedBox(height: 20),
            _buildAvailableSlotsHeader(context),
            const SizedBox(height: 20),
            _buildTimeSlots(context),
            const SizedBox(height: 10),
            _buildBookButton(context),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildAvailableSlotsHeader(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      color: AppColors.dark,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Available Slots",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today, color: AppColors.white),
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != _selectedDate) {
                  setState(() {
                    _selectedDate = picked;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlots(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TimeSlotBloc, TimeSlotState>(
        builder: (context, state) {
          if (state is TimeSlotLoading) {
            return const Center(child: TimeSlotGridLoding());
          } else if (state is TimeSlotLoaded) {
            return TimeSlotGrid(
              timeSlots: state.timeSlots,
              selectedSlot: state.selectedSlot,
              onSlotSelected: (slot) {
                context.read<TimeSlotBloc>().add(SelectTimeSlot(slot!));
              },
            );
          } else if (state is TimeSlotError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildBookButton(BuildContext context) {
    return BlocBuilder<TimeSlotBloc, TimeSlotState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            if (state is TimeSlotLoaded && state.selectedSlot != null) {
              print('selectedSlot: ${state.selectedSlot}');
              print('Doctor: ${widget.doctor.uId}');
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(
                    selectedSlot: state.selectedSlot!,
                    doctor: widget.doctor,
                    patientUId: widget.patientUId,
                    selectedDate: _selectedDate, 
                  ),
                ),
              );
            } else {
              // Handle the case when no slot is selected or state is not loaded
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please select a time slot'),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.dark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          child: const Text(
            'Book Appointment',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        );
      },
    );
  }
}