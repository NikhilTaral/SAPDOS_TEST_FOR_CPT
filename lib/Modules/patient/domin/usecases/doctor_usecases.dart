
import 'package:sopdas/Modules/patient/data/models/Doctor_List_model.dart';
import 'package:sopdas/Modules/patient/data/repositories/Doctor_List_repo.dart';

class GetDoctorUseCase {
  final DoctorListRepo _doctorListRepo;

  GetDoctorUseCase(this._doctorListRepo);

  Future<DoctorListModel> execute(doctorsList) async {
    return await _doctorListRepo.getDoctorListByuId(doctorsList);
  }
}