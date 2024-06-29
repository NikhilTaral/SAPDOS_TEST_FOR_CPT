import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sopdas/Modules/doctor/data/models/Doctor_Dashbord_module.dart';
import '../models/doctor_model.dart';

class DoctorRepository {
  final String baseUrl = 'https://sapdos-api-v2.azurewebsites.net/api';

  Future<Doctor> getDoctorByuId(String uId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/Doctor/GetDoctorByUId?DoctorUId=$uId'),
      headers: {'Content-Type': 'application/json'},
    );
    print('Response: ${response.body}');

    if (response.statusCode == 200) {
      return Doctor.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch doctor: ${response.reasonPhrase}');
    }
  }

  Future<DoctorDashbord> fetchDoctorDashboard(String uId, String date) async {
    final response = await http.get(Uri.parse(
        '$baseUrl/Doctor/GetDoctorDashbord?DoctorUId=$uId&Date=20%2F02%2F2024'));
    print('Response: ${response.body}');

    if (response.statusCode == 200) {
      return DoctorDashbord.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load DoctorDashboard');
    }
  }
}
