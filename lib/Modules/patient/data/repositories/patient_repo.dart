import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sopdas/Modules/patient/data/models/patient_model.dart';

class PatientRepository {
  final String baseUrl = 'https://sapdos-api-v2.azurewebsites.net/api';

  Future<PatientModel> getPatientByuId(String uId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/Patient/GetPatientByUId?PatientUId=$uId'),
      headers: {'Content-Type': 'application/json'},
    );
    print('Response: ${response.body}');

    if (response.statusCode == 200) {
      return PatientModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch patient: ${response.reasonPhrase}');
    }
  }

}
