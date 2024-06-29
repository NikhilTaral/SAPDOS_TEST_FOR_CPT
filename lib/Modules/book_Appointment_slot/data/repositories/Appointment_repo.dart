

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




// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:sopdas/Modules/payment/data/models/booking_model.dart';
// import 'package:sopdas/Modules/payment/data/repositories/booking_repo.dart';

// class AppointmentRepositoryImpl implements AppointmentRepository {
//   final http.Client client;

//   AppointmentRepositoryImpl(this.client);

//   @override
//   Future<void> bookAppointment(Appointment appointment) async {
//     final url = Uri.parse('https://sapdos-api-v2.azurewebsites.net/api/Patient/BookAppointment');
//     final headers = {'Content-Type': 'application/json'};
//     final body = jsonEncode({
//       'patientUId': appointment.patientUId,
//       'doctorUId': appointment.doctorUId,
//       'appointmentDate': appointment.appointmentDate,
//       'appointmentTime': appointment.appointmentTime,
//     });

//     final response = await client.post(url, headers: headers, body: body);

//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');

//     if (response.statusCode == 200) {
//       if (response.body.isNotEmpty) {
//         final jsonResponse = jsonDecode(response.body);
//         print('JSON Response: $jsonResponse');
//       } else {
//         print('Empty response body');
//         throw Exception("Booking failed: Empty response body");
//       }
//     } else {
//       throw Exception("Booking failed: ${response.reasonPhrase}");
//     }
//   }
// }
