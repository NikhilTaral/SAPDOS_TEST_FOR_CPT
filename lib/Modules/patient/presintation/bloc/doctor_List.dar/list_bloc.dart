// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sopdas/Modules/patient/data/repositories/Doctor_List_repo.dart';
// import 'package:sopdas/Modules/patient/presintation/bloc/doctor_List.dar/list_event.dart';
// import 'package:sopdas/Modules/patient/presintation/bloc/doctor_List.dar/list_state.dart';

// class DoctorListBloc extends Bloc<DoctorListEvent, DoctorListState> {
//   final DoctorListRepo doctorListRepo;

//   DoctorListBloc(this.doctorListRepo) : super(DoctorListInitial());

//   Stream<DoctorListState> mapEventToState(DoctorListEvent event) async* {
//     if (event is FetchDoctorList) {
//       yield DoctorListLoading();
//       try {
//         final doctorList = await doctorListRepo.getDoctorListByuId(event.uId);
//         yield DoctorListLoaded(doctorList);
//       } catch (e) {
//         yield DoctorListError(e.toString());
//       }
//     }
//   }
// }


// list_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sopdas/Modules/patient/data/repositories/doctor_list_repo.dart';
import 'package:sopdas/Modules/patient/presintation/bloc/doctor_List.dar/list_event.dart';
import 'package:sopdas/Modules/patient/presintation/bloc/doctor_List.dar/list_state.dart';

class DoctorListBloc extends Bloc<DoctorListEvent, DoctorListState> {
  final DoctorListRepo doctorListRepo;

  DoctorListBloc(this.doctorListRepo) : super(DoctorListInitial()) {
    on<FetchDoctorList>((event, emit) async {
      emit(DoctorListLoading());
      try {
        final doctorList = await doctorListRepo.getDoctorListByuId(event.uId);
        emit(DoctorListLoaded(doctorList));
      } catch (e) {
        emit(DoctorListError(e.toString()));
      }
    });
  }
}