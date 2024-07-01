import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sopdas/Modules/doctor/data/models/Doctor_Dashbord_module.dart';
import 'package:sopdas/core/colors/colores.dart';

class DashboardCard extends StatelessWidget {
  final String label;
  final String count;
  final double percentage;

  const DashboardCard({
    super.key,
    required this.label,
    required this.count,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 180,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.mid,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 40.0,
            lineWidth: 9.0,
            percent: percentage,
            center: Text(
              count,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            progressColor: AppColors.white,
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(height: 16.0),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final DoctorDashbord doctorDashboard;

  const DashboardScreen({super.key, required this.doctorDashboard});

  @override
  Widget build(BuildContext context) {
    double pendingPercentage = doctorDashboard.totalAppointment > 0
        ? doctorDashboard.pendingAppointment / doctorDashboard.totalAppointment
        : 0.0;
    double completedPercentage = doctorDashboard.totalAppointment > 0
        ? doctorDashboard.completedAppointment /
            doctorDashboard.totalAppointment
        : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DashboardCard(
              label: 'Pending Appointments',
              count: doctorDashboard.pendingAppointment.toString(),
              percentage: pendingPercentage,
            ),
            const SizedBox(height: 16.0),
            DashboardCard(
              label: 'Completed Appointments',
              count: doctorDashboard.completedAppointment.toString(),
              percentage: completedPercentage,
            ),
            const SizedBox(height: 16.0),
            DashboardCard(
              label: 'Total Appointments',
              count: doctorDashboard.totalAppointment.toString(),
              percentage: 1.0, // Always 100%
            ),
          ],
        ),
      ),
    );
  }
}
