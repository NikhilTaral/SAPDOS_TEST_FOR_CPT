import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sopdas/Modules/patient/data/repositories/doctor_list_repo.dart';
import 'package:sopdas/Modules/patient/presintation/bloc/doctor_List.dar/list_bloc.dart';
import 'package:sopdas/Modules/patient/presintation/bloc/doctor_List.dar/list_event.dart';
import 'package:sopdas/Modules/patient/presintation/bloc/patient_dashbord/patient_bloc.dart';
import 'package:sopdas/Modules/patient/data/repositories/patient_repo.dart';
import 'package:sopdas/Modules/patient/domin/usecases/patient_usecases.dart';
import 'package:sopdas/Modules/patient/presintation/widgets/patient_Drower.dart';

class PatientPage extends StatelessWidget {
  final dynamic uId;

  const PatientPage({super.key, required this.uId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PatientBloc(GetPatientUseCase(PatientRepository())),
        ),
        BlocProvider(
          create: (context) =>
              DoctorListBloc(DoctorListRepo())..add(FetchDoctorList(uId)),
        ),
      ],
      child: PatientView(uId: uId),
    );
  }
}
