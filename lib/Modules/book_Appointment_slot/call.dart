// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sopdas/Modules/book_Appointment_slot/data/provider/Slot_bookin_API.dart';
// import 'package:sopdas/Modules/book_Appointment_slot/data/repositories/slot_repositry.dart';
// import 'package:sopdas/Modules/book_Appointment_slot/presentation/pages/booook.dart';
// import 'package:sopdas/Modules/patient/data/models/Doctor_List_model.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiRepositoryProvider(
//       providers: [
//         RepositoryProvider(create: (context) => ApiProvider()),
//         RepositoryProvider(
//           create: (context) => TimeSlotRepository(context.read<ApiProvider>()),
//         ),
//       ],
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: AppointmentScreen(
//           doctor: Doctor(uId: 2323, name: "fdfff", specialization: "fdsf"),
//           doctorId: '15228c5a-ae32-418b-8a74-65b1dbe235b2',
//           date: '02/04/2022',
//         ),
//       ),
//     );
//   }
// }
