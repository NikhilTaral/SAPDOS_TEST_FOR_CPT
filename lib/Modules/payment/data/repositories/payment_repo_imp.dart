import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sopdas/Modules/payment/data/models/booking_model.dart';

// class AppointmentRepositoryImpl implements AppointmentRepository {
//   final http.Client client;

//   AppointmentRepositoryImpl(this.client);

//   @override
//   Future<void> bookAppointment(Appointment appointment) async {
//     final url = Uri.parse(
//         'https://sapdos-api-v2.azurewebsites.net/api/Patient/BookAppointment');
//      final response = await http.post(
//     url,
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode(appointment.toJson()),
//   );

    

//     if (response.statusCode != 200) {
//       throw Exception("Booking failed");
//     }
//   }
// }

class AppointmentRepositoryImpl {
  final String baseUrl = 'https://sapdos-api-v2.azurewebsites.net/api/Patient/BookAppointment';

  AppointmentRepositoryImpl(AppointmentRepositoryImpl appointmentRepositoryImpl);

  Future<void> bookAppointment(AppointmentRequest request) async {
    final url = Uri.parse(baseUrl);

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(request.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to book appointment: ${response.body}');
    }
  }
}



// Future<void> bookAppointment(AppointmentRequest request) async {
//   final url = Uri.parse('https://sapdos-api-v2.azurewebsites.net/api/Patient/BookAppointment');

//   final response = await http.post(
//     url,
//     headers: {
//       'Content-Type': 'application/json',
//     },
//     body: json.encode(request.toJson()),
//   );

//   if (response.statusCode == 200) {
//     print('Appointment booked successfully');
//   } else {
//     print('Failed to book appointment: ${response.body}');
//   }
// }

