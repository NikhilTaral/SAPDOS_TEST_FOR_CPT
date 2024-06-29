class Register {
  String id;
  String? uId;
  DateTime createdOn;
  DateTime updatedOn;
  String createdBy;
  String updatedBy;
  bool archived;
  int version;
  bool active;
  String dType;
  String name;
  String email;
  String mobileNumber;
  String address;
  String age;
  String specialization;
  List<String> documents;
  String role;
  String description;
  int experience;
  String password;
  String disease;

  Register({
    required this.id,
    required this.uId,
    required this.createdOn,
    required this.updatedOn,
    required this.createdBy,
    required this.updatedBy,
    required this.archived,
    required this.version,
    required this.active,
    required this.dType,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.address,
    required this.age,
    required this.specialization,
    required this.documents,
    required this.role,
    required this.description,
    required this.experience,
    required this.password,
    required this.disease,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uId': uId,
      'createdOn': createdOn.toIso8601String(),
      'updatedOn': updatedOn.toIso8601String(),
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'archived': archived,
      'version': version,
      'active': active,
      'dType': dType,
      'name': name,
      'email': email,
      'mobileNumber': mobileNumber,
      'address': address,
      'age': age,
      'specialization': specialization,
      'documents': documents,
      'role': role,
      'description': description,
      'experience': experience,
      'password': password,
      'disease': disease,
    };
  }
}
