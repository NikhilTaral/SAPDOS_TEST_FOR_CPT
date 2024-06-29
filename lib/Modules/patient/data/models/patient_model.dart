class PatientModel{
  final String? uId;
  final String? name;
  final String? specialization;
  final String? contact;

  PatientModel({
    required this.uId,
    required this.name,
    required this.specialization,
    required this.contact,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      uId: json['uId'],
      name: json['name'] ,
      specialization: json['specialization'],
      contact: json['contact'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'name': name,
      'specialization': specialization,
      'contact': contact,
    };
  }
}
