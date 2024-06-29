import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sopdas/Modules/patient/presintation/bloc/patient_dashbord/patient_event.dart';
import 'package:sopdas/Modules/patient/presintation/bloc/patient_dashbord/patient_state.dart';
import 'package:sopdas/Modules/patient/domin/usecases/patient_usecases.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  final GetPatientUseCase getPatientUseCase;
  

  PatientBloc(this.getPatientUseCase, )
      : super(PatientInitial()) {
    on<GetPatient>((event, emit) async {
      emit(PatientLoading());
      try {
        final patient = await getPatientUseCase.execute(event.uId);
        emit(PatientLoaded(patient));
      } catch (e) {
        emit(PatientError(e.toString()));
      }
    });

  }
}
