import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sopdas/Modules/Sign_In/data/models/singin_module.dart';


class AuthRepository {

  final String registerUrl = 'https://sapdos-api-v2.azurewebsites.net/api/Credentials/Register';

 

  Future<void> register(Register register) async {
    final response = await http.post(
      Uri.parse(registerUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(register.toJson()),
    );
if (response.statusCode == 200) {
      throw Exception('Registatin sucsessfull: ${response.reasonPhrase}');
    } else {
      throw Exception('Failed to fetch user: ${response.reasonPhrase}');
    }
    
  }
}





