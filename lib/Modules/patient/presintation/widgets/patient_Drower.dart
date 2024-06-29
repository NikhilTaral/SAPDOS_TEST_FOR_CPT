
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sopdas/Modules/patient/presintation/bloc/patient_dashbord/patient_bloc.dart';
import 'package:sopdas/Modules/patient/presintation/bloc/patient_dashbord/patient_event.dart';
import 'package:sopdas/Modules/patient/presintation/bloc/patient_dashbord/patient_state.dart';
import 'package:sopdas/Modules/patient/presintation/widgets/patient_details.dart';
import 'package:sopdas/core/colors/colores.dart';

class PatientView extends StatelessWidget {
  final dynamic uId;

  const PatientView({super.key, required this.uId});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var isLargeScreen = screenSize.width > 600;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.dark,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(),
              child: Text(
                'SAPDOS',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 44,
                ),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.dashboard_customize_outlined,
                    color: AppColors.white),
                title: const Text(
                  'Categories',
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
                onTap: () {}),
            ListTile(
              leading: const Icon(Icons.calendar_today_outlined,
                  color: AppColors.white),
              title: const Text(
                'Appointment',
                style: TextStyle(color: AppColors.white, fontSize: 20),
              ),
              onTap: () {},
            ),
            const ListTile(
              leading: Icon(Icons.chat_bubble, color: AppColors.white),
              title: Text(
                'Chat',
                style: TextStyle(color: AppColors.white, fontSize: 20),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.settings, color: AppColors.white),
              title: Text(
                'Settings',
                style: TextStyle(color: AppColors.white, fontSize: 20),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.logout, color: AppColors.white),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
                onTap: () {}),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: isLargeScreen ? 50 : 30,
      ),
      body: BlocBuilder<PatientBloc, PatientState>(
        builder: (context, state) {
          if (state is PatientInitial) {
            context.read<PatientBloc>().add(GetPatient(uId));
            return const Center(child: CircularProgressIndicator());
          } else if (state is PatientLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PatientLoaded) {
            return PatientDetail(
                patient: state.patient, isLargeScreen: isLargeScreen);
          } else if (state is PatientError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Unexpected state'));
        },
      ),
    );
  }
}
