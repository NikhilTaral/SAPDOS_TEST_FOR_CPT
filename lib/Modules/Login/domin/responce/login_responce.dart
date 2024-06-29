class LoginResponse {
  final dynamic uId;
  final String role;
  final String? name;

  LoginResponse({required this.uId, required this.role, required this.name});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      uId: json['uId'],
      role: json['role'],
      name: json['name'],
    );
  }
}
