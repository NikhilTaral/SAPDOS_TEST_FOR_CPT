class Doctor {
  final dynamic uId;
  final String? name;
  final String? specialization;
  final String? contact;

  Doctor({
    required this.uId,
    required this.name,
    required this.specialization,
    required this.contact,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      uId: json['uId'],
      name: json['name'],
      specialization: json['specialization'],
      contact: json['contact'],
    );
  }

  get dashboard => null;

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'name': name,
      'specialization': specialization,
      'contact': contact,
    };
  }
}
