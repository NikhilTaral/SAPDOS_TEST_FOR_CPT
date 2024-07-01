import 'package:flutter/material.dart';
import 'package:sopdas/Modules/doctor/data/models/doctor_model.dart';
import 'package:sopdas/core/colors/colores.dart';

class AppointmentTile extends StatelessWidget {
  final Doctor doctor;
  final String time;
  final String patientName;
  final String status;

  const AppointmentTile({
    super.key,
    required this.time,
    required this.patientName,
    required this.status,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    IconData iconData;
    Color iconColor;

    switch (status) {
      case 'completed':
        borderColor = Colors.green;
        iconData = Icons.check_circle;
        iconColor = Colors.green;
        break;
      case 'pending':
        borderColor = Colors.red;
        iconData = Icons.access_time;
        iconColor = Colors.red;
        break;
      case 'upcoming':
      default:
        borderColor = Colors.blue;
        iconData = Icons.access_time;
        iconColor = Colors.blue;
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: borderColor.withOpacity(0.1),
            child: Icon(iconData, color: iconColor),
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 1,
            child: Text(
              time,
              style: const TextStyle(
                color: AppColors.dark,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 3,
            child: SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) =>  PatientRecord(doctor: doctor,),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          patientName,
                          style: const TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'X years',
                        style: TextStyle(color: Colors.black),
                      ),
                      if (status == 'completed')
                        const Icon(Icons.check, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
