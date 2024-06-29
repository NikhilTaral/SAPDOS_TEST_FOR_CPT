class Doctor {
  final dynamic uId;
  final dynamic name;
  final dynamic specialization;

  Doctor({required this.uId, required this.name, required this.specialization});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      uId: json['uId'],
      name: json['name'],
      specialization: json['specialization'],
    );
  }
}

class DoctorListModel {
  final List<Doctor> doctors;

  DoctorListModel({required this.doctors});

  factory DoctorListModel.fromJson(List<dynamic> json) {
    return DoctorListModel(
      doctors: json.map((item) => Doctor.fromJson(item)).toList(),
    );
  }
}
