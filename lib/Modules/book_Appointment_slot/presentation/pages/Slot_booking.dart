// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// // Assuming the existence of these classes and packages:
// import 'package:sopdas/Modules/patient/data/models/Doctor_List_model.dart';
// import 'package:sopdas/Modules/book_Appointment_slot/data/models/slot_booking.dart';
// import 'package:sopdas/Modules/patient/data/models/patient_model.dart';
// import 'package:sopdas/core/colors/colores.dart';

// // Define your BLoC states and events if not already defined
// // Example placeholder for TimeSlotBloc:
// class TimeSlotBloc extends Bloc<TimeSlotEvent, TimeSlotState> {
//   TimeSlotBloc() : super(TimeSlotLoading());

//   Stream<TimeSlotState> mapEventToState(TimeSlotEvent event) async* {
//     // Implement your BLoC logic here
//   }
// }

// // Define your BLoC states
// abstract class TimeSlotState {}

// class TimeSlotLoading extends TimeSlotState {}

// class TimeSlotLoaded extends TimeSlotState {
//   final List<TimeSlot> timeSlots;
//   final String? selectedSlot;
//   TimeSlotLoaded(this.timeSlots, this.selectedSlot);
// }

// class TimeSlotError extends TimeSlotState {
//   final String message;
//   TimeSlotError(this.message);
// }

// // Define your BLoC events
// abstract class TimeSlotEvent {}

// class SelectTimeSlot extends TimeSlotEvent {
//   final String slot;
//   SelectTimeSlot(this.slot);
// }

// class AppointmentScreen extends StatelessWidget {
//   final Doctor doctor;
//   final String? selectedSlot;
//   final PatientModel patient;

//   const AppointmentScreen({
//     super.key,
//     required this.doctor,
//     required this.selectedSlot,
//     required this.patient
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(context),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ProfileSection(doctor: doctor),
//             const SizedBox(height: 20),
//             _buildAvailableSlotsHeader(context),
//             const SizedBox(height: 20),
//             _buildTimeSlots(context),
//             const SizedBox(height: 10),
//             _buildBookButton(context),
//           ],
//         ),
//       ),
//     );
//   }

//   AppBar _buildAppBar(BuildContext context) {
//     return AppBar(
//       leading: IconButton(
//         icon: const Icon(Icons.arrow_back),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//     );
//   }

//   Widget _buildAvailableSlotsHeader(BuildContext context) {
//     final screenwidth = MediaQuery.of(context).size.width;
//     return Container(
//       width: screenwidth,
//       color: AppColors.dark,
//       child: const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Text(
//           "Available Slots",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w700,
//             color: AppColors.white,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTimeSlots(BuildContext context) {
//     return Expanded(
//       child: BlocBuilder<TimeSlotBloc, TimeSlotState>(
//         builder: (context, state) {
//           if (state is TimeSlotLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is TimeSlotLoaded) {
//             return TimeSlotGrid(
//               timeSlots: state.timeSlots,
//               selectedSlot: state.selectedSlot,
//               onSlotSelected: (slot) {
//                 context.read<TimeSlotBloc>().add(SelectTimeSlot(slot));
//               },
//             );
//           } else if (state is TimeSlotError) {
//             return Center(child: Text(state.message));
//           }
//           return const SizedBox.shrink();
//         },
//       ),
//     );
//   }

//   Widget _buildBookButton(BuildContext context) {
//     return BlocBuilder<TimeSlotBloc, TimeSlotState>(
//       builder: (context, state) {
//         return ElevatedButton(
//           onPressed: () {
//             print("SELECTED SLOT mcheck ->" + selectedSlot!);
//             // print("SELECTED doctor mcheck ->"+doctor.name);
//             context.go(
//               '/paymentScreen',
//               extra: {
//                 'selectedSlot': selectedSlot,
//                 'doctor': doctor,
//                 'patient': patient,
//               },
//             );
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: AppColors.dark,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(4.0),
//             ),
//           ),
//           child: const Text(
//             'Book Appointment',
//             style: TextStyle(fontSize: 16, color: Colors.white),
//           ),
//         );
//       },
//     );
//   }
// }

// class ProfileSection extends StatelessWidget {
//   final Doctor doctor;

//   const ProfileSection({super.key, required this.doctor});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         bool isSmallScreen = constraints.maxWidth < 600;
//         return Row(
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.all(Radius.circular(20.0)),
//               child: FlutterLogo(size: isSmallScreen ? 40 : 50),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     doctor.name,
//                     style: const TextStyle(
//                         fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     doctor.specialization,
//                     style: const TextStyle(fontSize: 16, color: Colors.grey),
//                   ),
//                   const SizedBox(height: 5),
//                   const Row(
//                     children: [
//                       Icon(Icons.star, color: Colors.orange),
//                       Icon(Icons.star, color: Colors.orange),
//                       Icon(Icons.star, color: Colors.orange),
//                       Icon(Icons.star_half, color: Colors.orange),
//                       Icon(Icons.star_border, color: Colors.orange),
//                       SizedBox(width: 5),
//                       Text('512'),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     '5 Years',
//                     style: TextStyle(fontSize: 16, color: Colors.blue),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodt in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
//                     textAlign: TextAlign.start,
//                     softWrap: true,
//                     maxLines: null,
//                     overflow: TextOverflow.visible,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class TimeSlotGrid extends StatelessWidget {
//   final List<TimeSlot> timeSlots;
//   final String? selectedSlot;
//   final  Function(String?) onSlotSelected;

//   const TimeSlotGrid({
//     super.key,
//     required this.timeSlots,
//     required this.selectedSlot,
//     required this.onSlotSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: MediaQuery.of(context).size.width < 600 ? 1 : 3,
//         childAspectRatio: 8,
//         mainAxisSpacing: 12.0,
//         crossAxisSpacing: 12.0,
//       ),
//       itemCount: timeSlots.length,
//       itemBuilder: (context, index) {
//         final slot = timeSlots[index];
//         return Container(
//           color: AppColors.light,
//           child: GridTile(
//             child: ListTile(
//               title: Text(
//                 slot.time,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w300,
//                 ),
//               ),
//               leading: Radio<String?>(
//                 value: slot.time,
//                 groupValue: selectedSlot,
//                 onChanged: onSlotSelected,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
