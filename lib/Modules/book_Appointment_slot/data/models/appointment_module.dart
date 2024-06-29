import 'dart:convert';

class DoctorBookingModel {
  String name;
  String specialization;
  int experience;
  String uId;

  DoctorBookingModel({
    required this.name,
    required this.specialization,
    required this.experience,
    required this.uId,
  });

  factory DoctorBookingModel.fromRawJson(String str) =>
      DoctorBookingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoctorBookingModel.fromJson(Map<String, dynamic> json) =>
      DoctorBookingModel(
        name: json["name"],
        specialization: json["specialization"],
        experience: json["experience"],
        uId: json["uId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "specialization": specialization,
        "experience": experience,
        "uId": uId,
      };
}
