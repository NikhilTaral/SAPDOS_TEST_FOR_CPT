// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:sopdas/Modules/patient/data/models/Doctor_List_model.dart';

// class DoctorListRepo {
//   final String baseUrl = 'https://sapdos-api-v2.azurewebsites.net/api';

//   Future<DoctorListModel> getDoctorListByuId(dynamic uId) async {
//     final response = await http.get(
//       Uri.parse('$baseUrl/Patient/GetAllUser?Role=doctor'),
//       headers: {'Content-Type': 'application/json'},
//     );
//     print('Response: ${response.body}');

//     if (response.statusCode == 200) {
//       return DoctorListModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to fetch doctor list: ${response.reasonPhrase}');
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sopdas/Modules/patient/data/models/Doctor_List_model.dart';

class DoctorListRepo {
  final String baseUrl = 'https://sapdos-api-v2.azurewebsites.net/api';

  Future<DoctorListModel> getDoctorListByuId(String? uId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/Patient/GetAllUser?Role=Doctor'),
      headers: {'Content-Type': 'application/json'},
    );
    print('Response: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return DoctorListModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to fetch doctor list: ${response.reasonPhrase}');
    }
  }
}
