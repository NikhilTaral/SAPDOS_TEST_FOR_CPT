import 'package:sopdas/Modules/doctor/data/models/doctor_model.dart';
import 'package:sopdas/Modules/doctor/data/repositories/doctur_repo.dart';

class GetDoctorUseCase {
  final DoctorRepository repository;

  GetDoctorUseCase(this.repository);

  Future<Doctor> execute(String uId) async {
    return await repository.getDoctorByuId(uId);
  }
}
