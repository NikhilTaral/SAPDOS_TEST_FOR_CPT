// class Appointment {
//   final String patientUId;
//   final String doctorUId;
//   final String appointmentDate;
//   final String? appointmentTime;

//   Appointment({
//     required this.patientUId,
//     required this.doctorUId,
//     required this.appointmentDate,
//     this.appointmentTime,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'patientUId': patientUId,
//       'doctorUId': doctorUId,
//       'appointmentDate': appointmentDate
//     };
//   }
// }
class AppointmentRequest {
  final String? patientUId;
  final String? doctorUId;
  final String? appointmentDate;
  final String? appointmentTime;

  AppointmentRequest({
    required this.patientUId,
    required this.doctorUId,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'patientUId': patientUId,
      'doctorUId': doctorUId,
      'appointmentDate': appointmentDate,
      'appointmentTime': appointmentTime,
    };
  }
}
