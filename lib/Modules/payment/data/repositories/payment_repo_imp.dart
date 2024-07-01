import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sopdas/Modules/payment/data/models/booking_model.dart';
import 'package:sopdas/Modules/payment/domin/repositories/appintment_repo.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final String baseUrl = 'https://sapdos-api-v2.azurewebsites.net/api/Patient/BookAppointment';
  final http.Client client;

  AppointmentRepositoryImpl(this.client);

  @override
  Future<void> bookAppointment(AppointmentRequest request) async {
    final url = Uri.parse(baseUrl);

    final response = await client.post(
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
