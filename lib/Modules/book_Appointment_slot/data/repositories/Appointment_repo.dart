

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sopdas/Modules/book_Appointment_slot/data/models/appointment_module.dart';

abstract class RemoteDataSource {
  Future<DoctorBookingModel?> fetchDoctorByUId(String uId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final String baseUrl = 'https://sapdos-api-v2.azurewebsites.net/api';




  @override
  Future<DoctorBookingModel?> fetchDoctorByUId(String uId) async {
    final url = Uri.parse('$baseUrl/Patient/GetDoctorByUId?DoctorUId=$uId');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return DoctorBookingModel.fromJson(data);
      } else {
        final error = jsonDecode(response.body);
        throw Exception('Failed to fetch doctor: ${error['message']}');
      }
    } catch (e) {
      print('Error fetching doctor: $e');
      return null;
    }
  }
}


