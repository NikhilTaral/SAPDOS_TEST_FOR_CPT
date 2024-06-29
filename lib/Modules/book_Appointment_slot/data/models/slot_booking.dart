import 'dart:convert';

class TimeSlot {
  final String time;
  final bool isAvailable;

  TimeSlot({
    required this.time,
    required this.isAvailable,
  });

  factory TimeSlot.fromRawJson(String str) => TimeSlot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
    time: json["time"],
    isAvailable: json["isAvailable"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "isAvailable": isAvailable,
  };
}
