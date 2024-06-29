import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sopdas/Modules/Login/data/models/login_module.dart';
import 'package:sopdas/Modules/Login/domin/responce/login_responce.dart';

class AuthRepository {
  final String baseUrl = 'https://sapdos-api-v2.azurewebsites.net/api';

  Future<LoginResponse> login(Login login) async {
    final response = await http.post(
      Uri.parse('$baseUrl/Credentials/Login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(login.toJson()),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      final error = jsonDecode(response.body);
      throw Exception('Failed to login: ${error['message']}');
    }
  }

  Future<Map<String, dynamic>> getUserByUid(String uId, String role) async {
    late final http.Response response;

    if (role == "Doctor") {
      response = await http.get(
        Uri.parse('$baseUrl/Doctor/GetDoctorByUId?DoctorUId=$uId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } else if (role == 'patient') {
      response = await http.get(
        Uri.parse('$baseUrl/Patient/GetPatientByUId?PatientUId=$uId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } else {
      throw Exception('Invalid role: $role');
    }

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to fetch user: ${response.reasonPhrase}');
    }
  }
}



