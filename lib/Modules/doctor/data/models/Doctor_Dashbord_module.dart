

import 'dart:convert';

class DoctorDashbord {
    final int pendingAppointment;
    final int completedAppointment;
    final int totalAppointment;
    final List<PatientList> patientList;

    DoctorDashbord({
        required this.pendingAppointment,
        required this.completedAppointment,
        required this.totalAppointment,
        required this.patientList,
    });

    factory DoctorDashbord.fromRawJson(String str) => DoctorDashbord.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DoctorDashbord.fromJson(Map<String, dynamic> json) => DoctorDashbord(
        pendingAppointment: json["pendingAppointment"],
        completedAppointment: json["completedAppointment"],
        totalAppointment: json["totalAppointment"],
        patientList: List<PatientList>.from(json["patientList"].map((x) => PatientList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pendingAppointment": pendingAppointment,
        "completedAppointment": completedAppointment,
        "totalAppointment": totalAppointment,
        "patientList": List<dynamic>.from(patientList.map((x) => x.toJson())),
    };
double get pendingPercentage =>
      totalAppointment > 0 ? pendingAppointment / totalAppointment : 0.0;

  double get completedPercentage =>
      totalAppointment > 0 ? completedAppointment / totalAppointment : 0.0;
}

class PatientList {
    final String slotUId;
    final String patientUId;
    final String name;
    final String slotTime;
    final bool treated;

    PatientList({
        required this.slotUId,
        required this.patientUId,
        required this.name,
        required this.slotTime,
        required this.treated,
    });

    factory PatientList.fromRawJson(String str) => PatientList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PatientList.fromJson(Map<String, dynamic> json) => PatientList(
        slotUId: json["slotUId"],
        patientUId: json["patientUId"],
        name: json["name"],
        slotTime: json["slotTime"],
        treated: json["treated"],
    );

    Map<String, dynamic> toJson() => {
        "slotUId": slotUId,
        "patientUId": patientUId,
        "name": name,
        "slotTime": slotTime,
        "treated": treated,
    };
}

