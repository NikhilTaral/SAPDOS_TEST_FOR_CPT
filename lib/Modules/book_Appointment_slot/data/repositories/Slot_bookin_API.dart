import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sopdas/Modules/book_Appointment_slot/data/models/slot_booking.dart';

class ApiProvider {
  Future<List<TimeSlot>> fetchAvailableSlots(
      String doctorId, dynamic date) async {
    final response = await http.get(
      Uri.parse(
          'https://sapdos-api-v2.azurewebsites.net/api/Patient/GetAvailbleSlot?DoctorUId=$doctorId&Date=$date'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data
          .map((json) => TimeSlot.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load time slots');
    }
  }
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:sopdas/Modules/book_Appointment_slot/data/models/slot_booking.dart';

// class ApiProvider {
//   final http.Client httpClient;

//   ApiProvider({http.Client? httpClient})
//       : httpClient = httpClient ?? http.Client();

//   Future<List<TimeSlot>> fetchAvailableSlots(
//       String doctorId, String time) async {
//     final response = await httpClient.get(
//       Uri.parse(
//           'https://sapdos-api-v2.azurewebsites.net/api/Patient/GetAvailbleSlot?DoctorUId=$doctorId&Date=$time'),
//     );

//     if (response.statusCode == 200) {
//       try {
//         List<dynamic> time = json.decode(response.body) as List<dynamic>;
//         return time
//             .map((json) => TimeSlot.fromJson(json as Map<String, dynamic>))
//             .toList();
//       } catch (e) {
//         throw Exception('Failed to parse time slots: $e');
//       }
//     } else {
//       throw Exception('Failed to load time slots: ${response.reasonPhrase}');
//     }
//   }

//   void dispose() {
//     httpClient.close();
//   }
// }
