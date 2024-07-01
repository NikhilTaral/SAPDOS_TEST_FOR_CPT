// import 'package:flutter/material.dart';
// import 'package:sopdas/Modules/doctor/data/models/Doctor_Dashbord_module.dart';
// import 'package:sopdas/Modules/doctor/data/repositories/doctur_repo.dart';
// import 'package:intl/intl.dart';

// class ParentWidget extends StatefulWidget {
//   @override
//   _ParentWidgetState createState() => _ParentWidgetState();
// }

// class _ParentWidgetState extends State<ParentWidget> {
//   final DoctorRepository _doctorRepository = DoctorRepository();

//   void _onDateSelected(DateTime date) {
//     setState(() {
//     });
//     _fetchDoctorDashboard(date);
//   }

//   void _fetchDoctorDashboard(DateTime date) async {
//     String formattedDate = DateFormat('dd-MM-yyyy').format(date);
//     try {
//       DoctorDashbord dashboard = await _doctorRepository.fetchDoctorDashboard('yourDoctorUId', formattedDate);
     
//       print('Dashboard: $dashboard');
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Calender(onDateSelected: _onDateSelected),
        
//         ],
//       ),
//     );
//   }
// }
