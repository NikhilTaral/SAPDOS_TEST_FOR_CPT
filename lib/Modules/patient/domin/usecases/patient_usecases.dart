
import 'package:sopdas/Modules/patient/data/models/patient_model.dart';
import 'package:sopdas/Modules/patient/data/repositories/patient_repo.dart';


class GetPatientUseCase {
  final PatientRepository repository;

  GetPatientUseCase(this.repository);

  Future<PatientModel> execute(dynamic uId) async {
    return await repository.getPatientByuId(uId);
  }
}



