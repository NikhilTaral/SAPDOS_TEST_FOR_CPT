import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/Slot_booking/slote_booking_bloc.dart';
import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/Slot_booking/slote_booking_event.dart';
import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/Slot_booking/slote_booking_state.dart';

import 'package:sopdas/Modules/book_Appointment_slot/presentation/pages/profile.dart';
import 'package:sopdas/Modules/book_Appointment_slot/presentation/wigets/time_slot.dart';
import 'package:sopdas/Modules/patient/data/models/Doctor_List_model.dart';
import 'package:sopdas/core/colors/colores.dart';

// class AppointmentScreen extends StatelessWidget {
//   final Doctor doctor;
//   final String doctorId;
//   final String date;

//   const AppointmentScreen({
//     super.key,
//     required this.doctor,
//     required this.doctorId,
//     required this.date,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final screenwidth = MediaQuery.of(context).size.width;
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => TimeSlotBloc(
//             RepositoryProvider.of(context),
//           )..add(FetchTimeSlots(doctorId, date)),
//         ),
//       ],
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               ProfileSection(
//                 doctor: doctor,
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: screenwidth,
//                 color: AppColors.dark,
//                 child: const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     "Available Slots",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: BlocBuilder<TimeSlotBloc, TimeSlotState>(
//                   builder: (context, state) {
//                     if (state is TimeSlotLoading) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (state is TimeSlotLoaded) {
//                       return TimeSlotGrid(
//                         timeSlots: state.timeSlots,
//                         selectedSlot: state.selectedSlot,
//                         onSlotSelected: (slot) {
//                           context
//                               .read<TimeSlotBloc>()
//                               .add(SelectTimeSlot(slot));
//                         },
//                       );
//                     } else if (state is TimeSlotError) {
//                       return Center(child: Text(state.message));
//                     }
//                     return const SizedBox.shrink();
//                   },
//                 ),
//               ),
//               const SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {

//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.dark,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(4.0),
//                   ),
//                 ),
//                 child: const Text(
//                   'Book Appointment',
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class AppointmentScreen extends StatelessWidget {
  final Doctor doctor;
  final dynamic selectedSlot;

  const AppointmentScreen({
    super.key,
    required this.doctor,
    required this.selectedSlot,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfileSection(doctor: doctor),
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
    final screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth,
      color: AppColors.dark,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Available Slots",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlots(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TimeSlotBloc, TimeSlotState>(
        builder: (context, state) {
          if (state is TimeSlotLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TimeSlotLoaded) {
            return TimeSlotGrid(
              timeSlots: state.timeSlots,
              selectedSlot: state.selectedSlot,
              onSlotSelected: (slot) {
                context.read<TimeSlotBloc>().add(SelectTimeSlot(slot));
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
            context.go(
              '/paymentScreen',
              extra: {
                'selectedSlot': selectedSlot,
                'doctor': doctor,
              },
            );
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
