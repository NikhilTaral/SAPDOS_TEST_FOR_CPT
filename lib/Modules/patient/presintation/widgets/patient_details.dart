import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sopdas/Modules/patient/data/models/patient_model.dart';
import 'package:sopdas/Modules/patient/presintation/bloc/doctor_List.dar/list_bloc.dart';
import 'package:sopdas/Modules/patient/presintation/bloc/doctor_List.dar/list_state.dart';
import 'package:sopdas/Modules/patient/presintation/widgets/Doctor_card.dart';
import 'package:sopdas/core/colors/colores.dart';

class PatientDetail extends StatelessWidget {
  final PatientModel patient;
  final bool isLargeScreen;

  const PatientDetail(
      {super.key, required this.patient, required this.isLargeScreen});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hallo!",
                            style: TextStyle(
                              fontSize: isLargeScreen ? 32 : 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            patient.name ?? '',
                            style: TextStyle(
                              fontSize: isLargeScreen ? 32 : 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: isLargeScreen ? 60 : 30,
                      child: FlutterLogo(size: isLargeScreen ? 40 : 50),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Card(
                  color: AppColors.dark,
                  elevation: 8,
                  child: SizedBox(
                    height: 45,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Doctor's List",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white),
                          ),
                          Icon(
                            Icons.filter_list,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<DoctorListBloc, DoctorListState>(
                    builder: (context, state) {
                      if (state is DoctorListLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is DoctorListLoaded) {
                        return GridView.count(
                            crossAxisCount: isLargeScreen ? 2 : 1,
                            childAspectRatio:
                                isLargeScreen ? (1 / .3) : (1 / .4),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: state.doctorList.doctors.map((doctor) {
                              return buildDoctorCard(
                                context,
                                doctor,
                                (MediaQuery.of(context).size.width > 600),
                              );
                            }).toList());
                      } else if (state is DoctorListError) {
                        return Center(child: Text(state.message));
                      }
                      return const Center(child: Text('Unexpected state'));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
