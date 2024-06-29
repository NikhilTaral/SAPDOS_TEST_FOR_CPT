
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sopdas/Modules/book_Appointment_slot/domin/use_cases/booking_usecases.dart';
import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/doctor_detals/book_appointment_event.dart';
import 'package:sopdas/Modules/book_Appointment_slot/presentation/bloc/doctor_detals/book_appointment_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final FetchDoctorByUId fetchDoctorByUId;

  DoctorBloc(this.fetchDoctorByUId) : super(DoctorInitial());

  Stream<DoctorState> mapEventToState(DoctorEvent event) async* {
    if (event is FetchDoctor) {
      yield DoctorLoading();
      try {
        final doctor = await fetchDoctorByUId.execute(event.uId);
        if (doctor != null) {
          yield DoctorLoaded(doctor);
        } else {
          yield DoctorError('Doctor not found');
        }
      } catch (e) {
        yield DoctorError(e.toString());
      }
    }
  }
}
