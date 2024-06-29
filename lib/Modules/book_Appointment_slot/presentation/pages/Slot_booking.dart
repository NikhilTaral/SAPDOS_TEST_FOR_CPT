



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/Slot_booking/slote_booking_bloc.dart';
// import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/Slot_booking/slote_booking_event.dart';
// import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/Slot_booking/slote_booking_state.dart';
// import 'package:sopdas/Modules/book_Appointment_slot/presentation/wigets/time_slot.dart';
// import 'package:sopdas/core/colors/colores.dart';

// class AvailableSlotsSection extends StatelessWidget {
//   final String doctorId;
//   final String date;

//   const AvailableSlotsSection({super.key, required this.doctorId, required this.date});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TimeSlotBloc(
//         RepositoryProvider.of(context),
//       )..add(FetchTimeSlots(doctorId, date)),
//       child: Column(
//         children: [
//           const Card(
//             color: AppColors.dark,
//             elevation: 8,
//             child: SizedBox(
//               height: 45,
//               child: Padding(
//                 padding: EdgeInsets.only(right: 20, left: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Icon(
//                       Icons.access_alarm,
//                       color: AppColors.white,
//                     ),
//                     Text(
//                       "Available Slots",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.white,
//                       ),
//                     ),
//                     Icon(
//                       Icons.calendar_month,
//                       color: AppColors.white,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Expanded(
//             child: BlocBuilder<TimeSlotBloc, TimeSlotState>(
//               builder: (context, state) {
//                 if (state is TimeSlotLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is TimeSlotLoaded) {
//                   return TimeSlotGrid(
//                     timeSlots: state.timeSlots,
//                     selectedSlot: state.selectedSlot,
//                     onSlotSelected: (slot) {
//                       context.read<TimeSlotBloc>().add(SelectTimeSlot(slot!));
//                     },
//                   );
//                 } else if (state is TimeSlotError) {
//                   return Center(child: Text(state.message));
//                 }
//                 return const SizedBox.shrink();
//               },
//             ),
//           ),
//           const SizedBox(height: 2),
//           ElevatedButton(
//             onPressed: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) => const Payment(),
//               //   ),
//               // );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.dark,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4.0),
//               ),
//             ),
//             child: const Text(
//               'Book Appointment',
//               style: TextStyle(fontSize: 16, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
