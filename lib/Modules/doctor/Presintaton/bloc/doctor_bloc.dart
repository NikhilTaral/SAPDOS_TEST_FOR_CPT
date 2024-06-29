import 'package:bloc/bloc.dart';
import 'package:sopdas/Modules/Doctor/domin/usecases/doctor_usecases.dart';
import 'package:sopdas/Modules/doctor/data/repositories/doctur_repo.dart';
import 'doctor_event.dart';
import 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final GetDoctorUseCase getDoctorUseCase;
  final DoctorRepository repository;

  DoctorBloc(this.getDoctorUseCase, this.repository) : super(DoctorInitial()) {
    on<GetDoctor>((event, emit) async {
      emit(DoctorLoading());
      try {
        final doctor = await getDoctorUseCase.execute(event.uId);
       

        
       
        final doctorDashboard = await repository.fetchDoctorDashboard(event.uId, DateTime.now().toString());
        emit(DoctorLoaded(doctor, doctorDashboard));
      
      } catch (e) {
        emit(DoctorError(e.toString()));
      }
    });
  }
}

class DoctorDashboardBloc
    extends Bloc<DoctorDashboardEvent, DoctorDashboardState> {
  final DoctorRepository repository;

  DoctorDashboardBloc({required this.repository})
      : super(DoctorDashboardInitial());

  Stream<DoctorDashboardState> mapEventToState(
      DoctorDashboardEvent event) async* {
    if (event is FetchDoctorDashboard) {
      yield DoctorDashboardLoading();
      try {
        final dashboard =
            await repository.fetchDoctorDashboard(event.uId, event.date);
        yield DoctorDashboardLoaded(dashboard: dashboard);
      } catch (e) {
        yield DoctorDashboardError(message: e.toString());
      }
    }
  }
}
