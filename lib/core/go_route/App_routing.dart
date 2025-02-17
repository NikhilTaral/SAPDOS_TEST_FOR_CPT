// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sopdas/Modules/Login/presintaton/page/login_page.dart';
// import 'package:sopdas/Modules/Sign_In/presintaton/page/signin_page.dart';
// import 'package:sopdas/Modules/book_Appointment_slot/data/models/slot_booking.dart';
// import 'package:sopdas/Modules/book_Appointment_slot/data/provider/Slot_bookin_API.dart';
// import 'package:sopdas/Modules/book_Appointment_slot/data/repositories/slot_repositry.dart';
// import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/Slot_booking/slote_booking_bloc.dart';
// import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/Slot_booking/slote_booking_event.dart';
// import 'package:sopdas/Modules/book_Appointment_slot/presentation/pages/booook.dart';
// import 'package:sopdas/Modules/patient/data/models/patient_model.dart';
// import 'package:sopdas/Modules/doctor/Presintaton/pages/doctor_dashbord.dart';
// import 'package:sopdas/Modules/patient/data/models/Doctor_List_model.dart';
// import 'package:sopdas/Modules/patient/presintation/pages/patient_Dashbord.dart';
// import 'package:sopdas/Modules/payment/presintaton/pages/next.dart';
// import 'package:sopdas/Modules/welcome/presintaton/page/welcome_page.dart';

// final GoRouter router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const Welcome(),
//     ),
//     GoRoute(
//       path: '/login',
//       builder: (context, state) => LoginPage(),
//     ),
//     GoRoute(
//       path: '/registerPage',
//       builder: (context, state) => const RegisterPage(),
//     ),
//     GoRoute(
//       path: '/doctor',
//       builder: (context, state) {
//         final uId = (state.extra as Map<String, dynamic>?)?['name'] ?? 'Doctor';
//         return DoctorPage(
//           uId: uId,
//         );
//       },
//     ),
//     GoRoute(
//       path: '/patient',
//       builder: (context, state) {
//         final uId = (state.extra as Map<String, dynamic>?)?['name'] ?? 'Doctor';
//         return PatientPage(
//           uId: uId,
//         );
//       },
//     ),
//     GoRoute(
//   path: '/AppointmentScreen',
//   builder: (context, state) {
//     final doctor = state.extra as Doctor;

//     return MultiRepositoryProvider(
//       providers: [
//         RepositoryProvider<ApiProvider>(create: (context) => ApiProvider()),
//         RepositoryProvider<TimeSlotRepository>(
//           create: (context) => TimeSlotRepository(context.read<ApiProvider>()),
//         ),
//       ],
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider<TimeSlotBloc>(
//             create: (context) => TimeSlotBloc(
//               context.read<TimeSlotRepository>(),
//             )..add(const FetchTimeSlots('doctorId', 'date')),
//           ),
//         ],
//         child: AppointmentScreen(doctor: doctor, selectedSlot: null),
//       ),
//     );
//   },
// ),

//     GoRoute(
//       path: '/paymentScreen',
//       builder: (context, state) {
//         final data = state.extra as Map<String, dynamic>?;

//         if (data == null) {
//           throw Exception("No data provided for payment screen");
//         }

//         final selectedSlot = data['selectedSlot'] as TimeSlot?;
//         final doctor = data['doctor'] as Doctor?;
//         final patient = data['patient'] as PatientModel?;

//         if (selectedSlot == null || doctor == null || patient == null) {
//           throw Exception("Incomplete data for payment screen");
//         }

//         return PaymentScreen(
//           selectedSlot: selectedSlot,
//           doctor: doctor,
//           patient: patient,
//         );
//       },
//     )

// // GoRoute(
// //       path: '/paymentScreen',
// //       builder: (context, state) {
// //         final data = state.extra as Map<String?, dynamic>;
// //         final selectedSlot = data['selectedSlot'] as TimeSlot;
// //         final doctor = data['doctor'] as Doctor;

// //         final Patient = data['patient'] as PatientModel;
// //         return PaymentScreen(
// //           selectedSlot: selectedSlot,
// //           doctor: doctor,
// //           Patient: Patient, appointmentTime: '',
// //         );
// //       },
// //     ),
//   ],
// );

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sopdas/Modules/Login/presintaton/page/login_page.dart';
import 'package:sopdas/Modules/Sign_In/presintaton/page/signin_page.dart';
import 'package:sopdas/Modules/book_Appointment_slot/data/models/slot_booking.dart';
import 'package:sopdas/Modules/book_Appointment_slot/data/repositories/Slot_bookin_API.dart';
import 'package:sopdas/Modules/book_Appointment_slot/domin/responce/slot_repositry.dart';
import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/Slot_booking/slote_booking_bloc.dart';
import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/Slot_booking/slote_booking_event.dart';
import 'package:sopdas/Modules/book_Appointment_slot/presentation/pages/booook.dart';
import 'package:sopdas/Modules/patient/data/models/patient_model.dart';
import 'package:sopdas/Modules/doctor/Presintaton/pages/doctor_dashbord.dart';
import 'package:sopdas/Modules/patient/data/models/Doctor_List_model.dart';
import 'package:sopdas/Modules/patient/presintation/pages/patient_Dashbord.dart';
import 'package:sopdas/Modules/payment/presintaton/pages/next.dart';
import 'package:sopdas/Modules/welcome/presintaton/page/welcome_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Welcome(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/registerPage',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/doctor',
      builder: (context, state) {
        final uId = (state.extra as Map<String, dynamic>?)?['name'] ?? 'Doctor';
        return DoctorPage(
          uId: uId,
        );
      },
    ),
    GoRoute(
      path: '/patient',
      builder: (context, state) {
        final uId = (state.extra as Map<String, dynamic>?)?['name'] ?? 'Doctor';
        return PatientPage(
          uId: uId,
        );
      },
    ),
    GoRoute(
      path: '/AppointmentScreen',
      builder: (context, state) {
        final doctor = state.extra as Doctor;
       // final selectedSlot = state.;

        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider<ApiProvider>(create: (context) => ApiProvider()),
            RepositoryProvider<TimeSlotRepository>(
              create: (context) =>
                  TimeSlotRepository(context.read<ApiProvider>()),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<TimeSlotBloc>(
                create: (context) => TimeSlotBloc(
                  context.read<TimeSlotRepository>(),
                )..add(const FetchTimeSlots('doctorId', 'date')),
              ),
            ],
            child: AppointmentScreen(doctor: doctor, selectedSlot:bool,),
          ),
        );
      },
    ),
    GoRoute(
      path: '/paymentScreen',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>?;

        if (data == null) {
          throw Exception("No data provided for payment screen");
        }

        final selectedSlot = data['selectedSlot'] as TimeSlot?;
        final doctor = data['doctor'] as Doctor?;
        final patient = data['patient'] as PatientModel?;

        if (selectedSlot == null || doctor == null || patient == null) {
          throw Exception("Incomplete data for payment screen");
        }

        return PaymentScreen(
          selectedSlot: selectedSlot,
          doctor: doctor,
          patient: patient,
        );
      },
    ),
  ],
);
