import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sopdas/Modules/patient/data/models/Doctor_List_model.dart';
import 'package:sopdas/Modules/patient/data/models/patient_model.dart';

Widget buildDoctorCard(
  BuildContext context,
  Doctor doctor,
  PatientModel patient,
  
  bool isLargeScreen,
) {
  double rating = 4.5; 

  return GestureDetector(
    onTap: () {
      
      print("mcheck DOCOTOR SCREEN 1" +  doctor.name);
      context.push(
        '/AppointmentScreen',
        extra: {
          'doctor': doctor,
          'patient': patient,
          'isLargeScreen': isLargeScreen,
        },
      );
      // Navigate to doctor's detailed profile page on tap
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => DoctorProfileScreen(doctor: doctor),
      //   ),
      // );
    },
    child: Card(
      elevation: 5,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color(0xFFE5E8F2),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: isLargeScreen ? 40 : 50,
              child: FlutterLogo(size: isLargeScreen ? 40 : 50),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    doctor.name,
                    style: TextStyle(
                      fontSize: isLargeScreen ? 18 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    doctor.specialization,
                    style: TextStyle(
                      fontSize: isLargeScreen ? 14 : 12,
                      color: Colors.grey[700],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      // Dynamic star rating !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                      _buildStarRating(rating),
                      const SizedBox(width: 5),
                      Text(
                        'Free',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

//  build star rating icons iiiiiiiiiiiiiiiii
Widget _buildStarRating(double rating) {
  int fullStars = rating.floor();
  bool hasHalfStar = rating - fullStars >= 0.5;

  List<Widget> stars = [];
  for (int i = 0; i < fullStars; i++) {
    stars.add(const Icon(Icons.star, color: Colors.amber, size: 20));
  }
  if (hasHalfStar) {
    stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 20));
  }

  return Row(children: stars);
}
