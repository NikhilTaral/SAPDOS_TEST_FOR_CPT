import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sopdas/Modules/Doctor/domin/usecases/doctor_usecases.dart';
import 'package:sopdas/Modules/doctor/Presintaton/pages/Doctor_patient_details.dart';
import 'package:sopdas/Modules/doctor/Presintaton/pages/card.dart';
import 'package:sopdas/Modules/doctor/data/models/Doctor_Dashbord_module.dart';
import 'package:sopdas/Modules/doctor/data/repositories/doctur_repo.dart';
import 'package:sopdas/core/colors/colores.dart';
import '../bloc/doctor_bloc.dart';
import '../bloc/doctor_event.dart';
import '../bloc/doctor_state.dart';

class DoctorPage extends StatefulWidget {
  final String uId;

  const DoctorPage({super.key, required this.uId});

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  DateTime _selectedDate = DateTime.now();
  final List<DateTime> _dates = List<DateTime>.generate(
    365,
    (i) => DateTime.now().subtract(Duration(days: i)),
  );
  final DoctorRepository _doctorRepository = DoctorRepository();

  DateTime? _storedSelectedDate;
  DoctorDashbord? _doctorDashboard;

  @override
  void initState() {
    super.initState();
    fetchDashboardData(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var isLargeScreen = screenSize.width > 600;
    return BlocProvider(
      create: (context) =>
          DoctorBloc(GetDoctorUseCase(DoctorRepository()), DoctorRepository())
            ..add(GetDoctor(widget.uId)),
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: AppColors.dark,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(),
                child: Text(
                  'SAPDOS',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 44,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.dashboard_customize_outlined,
                    color: AppColors.white),
                title: const Text(
                  'Categories',
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today_outlined,
                    color: AppColors.white),
                title: const Text(
                  'Appointment',
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.chat_bubble, color: AppColors.white),
                title: const Text(
                  'Chat',
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: AppColors.white),
                title: const Text(
                  'Settings',
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: AppColors.white),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 42,
        ),
        body: BlocBuilder<DoctorBloc, DoctorState>(
          builder: (context, state) {
            if (state is DoctorInitial) {
              return const Center(child: Text('Please wait...'));
            } else if (state is DoctorLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DoctorLoaded) {
              final doctor = state.doctor;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: isLargeScreen ? 50 : 30),
                                ),
                                Text(
                                  'Dr. ${doctor.name}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: isLargeScreen ? 30 : 20),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50.0),
                            child: CircleAvatar(
                              radius: isLargeScreen ? 60 : 50,
                              backgroundImage: const NetworkImage(
                                  'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 25.0, top: 16),
                        child: Text(
                          "Today's Appointments",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (_doctorDashboard != null)
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  DashboardCard(
                                    label: 'Pending Appointments',
                                    count: _doctorDashboard!.pendingAppointment
                                        .toString(),
                                    percentage:
                                        _doctorDashboard!.pendingPercentage,
                                  ),
                                  const SizedBox(
                                    height: 16.0,
                                    width: 10,
                                  ),
                                  DashboardCard(
                                    label: 'Completed Appointments',
                                    count: _doctorDashboard!
                                        .completedAppointment
                                        .toString(),
                                    percentage:
                                        _doctorDashboard!.completedPercentage,
                                  ),
                                  const SizedBox(height: 16.0, width: 10),
                                  DashboardCard(
                                    label: 'Total Appointments',
                                    count: _doctorDashboard!.totalAppointment
                                        .toString(),
                                    percentage: 1.0, // Always 100%
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 26),
                            // Calendar UI
                            Card(
                              color: AppColors.dark,
                              elevation: 8,
                              child: SizedBox(
                                height: 80,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat('EEEE, MMMM d')
                                            .format(_selectedDate),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      DropdownButton<DateTime>(
                                        dropdownColor: AppColors.dark,
                                        icon: const Icon(
                                            Icons.calendar_month_sharp,
                                            color: AppColors.white),
                                        value: _selectedDate,
                                        onChanged: (DateTime? newValue) {
                                          setState(() {
                                            if (newValue != null) {
                                              _selectedDate = newValue;
                                              _storedSelectedDate = newValue;
                                              // Call the repository method with the selected date
                                              fetchDashboardData(
                                                  _storedSelectedDate!);
                                            }
                                          });
                                        },
                                        items: _dates
                                            .map<DropdownMenuItem<DateTime>>(
                                                (DateTime date) {
                                          return DropdownMenuItem<DateTime>(
                                            value: date,
                                            child: Text(
                                              DateFormat('yyyy-MM-dd')
                                                  .format(date),
                                              style: const TextStyle(
                                                  color: AppColors.white),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Patient List
                            Container(
                              padding: const EdgeInsets.all(10),
                              width: screenSize.width * 0.94,
                              height: screenSize.height * 0.5,
                              child: ListView.builder(
                                itemCount: _doctorDashboard!.patientList.length,
                                itemBuilder: (context, index) {
                                  List<PatientList> patientList =
                                      _doctorDashboard!.patientList;
                                  bool isBooked = patientList[index].treated;
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PatientDetailPage(
                                            patient: patientList[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                patientList[index].slotTime,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                            ),
                                            Expanded(
                                              flex: 9,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 10, 10, 10),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: AppColors.dark),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          patientList[index]
                                                              .name,
                                                          style: const TextStyle(
                                                              fontSize: 14,
                                                              color: AppColors
                                                                  .dark),
                                                        ),
                                                        // Add spacer
                                                        const Spacer(),
                                                        Icon(
                                                          isBooked
                                                              ? Icons
                                                                  .check_circle_outline_rounded
                                                              : Icons
                                                                  .close_rounded,
                                                          size: 30,
                                                          color: isBooked
                                                              ? Colors.green
                                                              : Colors.red,
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: screenSize.height * 0.02,
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            } else if (state is DoctorError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  void fetchDashboardData(DateTime selectedDate) async {
    try {
      final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      final dashboardData = await _doctorRepository.fetchDoctorDashboard(
          widget.uId, formattedDate);
      setState(() {
        _doctorDashboard = dashboardData;
      });
    } catch (error) {
      print('Error fetching dashboard data: $error');
    }
  }
}


//////////////////////////////////
///

// Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => responsive_patient_details(
                                      //         pId: patientList[index].patientUId,
                                      //         slotId: patientList[index].slotUId,
                                      //         doctorUId: '',
                                      //       ),
                                      //     ));


// class DoctorPage extends StatelessWidget {
//   final String uId;

//   const DoctorPage({super.key, required this.uId});

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     var isLargeScreen = screenSize.width > 600;
//     return BlocProvider(
//       create: (context) => DoctorBloc(GetDoctorUseCase(DoctorRepository()), DoctorRepository())..add(GetDoctor(uId)),
//       child: Scaffold(
//         drawer: Drawer(
//           backgroundColor: AppColors.dark,
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               const DrawerHeader(
//                 padding: EdgeInsets.all(40),
//                 decoration: BoxDecoration(),
//                 child: Text(
//                   'SAPDOS',
//                   style: TextStyle(
//                     color: AppColors.white,
//                     fontSize: 44,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.dashboard_customize_outlined, color: AppColors.white),
//                 title: const Text('Categories', style: TextStyle(color: AppColors.white, fontSize: 20)),
//                 onTap: () {},
//               ),
//               ListTile(
//                 leading: const Icon(Icons.calendar_today_outlined, color: AppColors.white),
//                 title: const Text('Appointment', style: TextStyle(color: AppColors.white, fontSize: 20)),
//                 onTap: () {},
//               ),
//               ListTile(
//                 leading: const Icon(Icons.chat_bubble, color: AppColors.white),
//                 title: const Text('Chat', style: TextStyle(color: AppColors.white, fontSize: 20)),
//                 onTap: () {},
//               ),
//               ListTile(
//                 leading: const Icon(Icons.settings, color: AppColors.white),
//                 title: const Text('Settings', style: TextStyle(color: AppColors.white, fontSize: 20)),
//                 onTap: () {},
//               ),
//               ListTile(
//                 leading: const Icon(Icons.logout, color: AppColors.white),
//                 title: const Text('Logout', style: TextStyle(color: AppColors.white, fontSize: 20)),
//                 onTap: () {},
//               ),
//             ],
//           ),
//         ),
//         appBar: AppBar(
//           toolbarHeight: 42,
//         ),
//         body: BlocBuilder<DoctorBloc, DoctorState>(
//           builder: (context, state) {
//             if (state is DoctorInitial) {
//               return const Center(child: Text('Please wait...'));
//             } else if (state is DoctorLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is DoctorLoaded) {
//               final doctorDashboard = state.doctorDashboard;
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 30.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Hello!',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w900,
//                                     fontSize: isLargeScreen ? 50 : 30),
//                               ),
//                               Text(
//                                 'Dr. ${state.doctor.name}',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: isLargeScreen ? 30 : 20),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 50.0),
//                           child: CircleAvatar(
//                             radius: isLargeScreen ? 60 : 50,
//                             backgroundImage: const NetworkImage(
//                                 'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 25.0, top: 16),
//                       child: Text(
//                         "Today's Appointments",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 30),
//                       child: Row(
//                         children: [
//                           DashboardCard(
//                             label: 'Pending Appointments',
//                             count: doctorDashboard.pendingAppointment.toString(),
//                             percentage: doctorDashboard.pendingPercentage,
//                           ),
//                           const SizedBox(height: 16.0, width: 10),
//                           DashboardCard(
//                             label: 'Completed Appointments',
//                             count: doctorDashboard.completedAppointment.toString(),
//                             percentage: doctorDashboard.completedPercentage,
//                           ),
//                           const SizedBox(height: 16.0, width: 10),
//                           DashboardCard(
//                             label: 'Total Appointments',
//                             count: doctorDashboard.totalAppointment.toString(),
//                             percentage: 1.0, // Always 100%
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 26),
//                     CalendarDropdown(
//                       doctorRepository: DoctorRepository(),
//                       uId: uId,
//                     ),
//                   ],
//                 ),
//               );
//             } else if (state is DoctorError) {
//               return Center(child: Text(state.message));
//             } else {
//               return Container();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// class CalendarDropdown extends StatefulWidget {
//   final DoctorRepository doctorRepository;
//   final String uId;

//   const CalendarDropdown({super.key, required this.doctorRepository, required this.uId});

//   @override
//   _CalendarDropdownState createState() => _CalendarDropdownState();
// }

// class _CalendarDropdownState extends State<CalendarDropdown> {
//   DateTime _selectedDate = DateTime.now();
//   final List<DateTime> _dates = List<DateTime>.generate(
//     30,
//     (i) => DateTime.now().subtract(Duration(days: i)),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: AppColors.dark,
//       elevation: 8,
//       child: SizedBox(
//         height: 80,
//         child: Padding(
//           padding: const EdgeInsets.only(right: 20, left: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 DateFormat('EEEE, MMMM d').format(_selectedDate),
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700,
//                   color: AppColors.white,
//                 ),
//               ),
//               DropdownButton<DateTime>(
//                 dropdownColor: AppColors.dark,
//                 icon: Icon(Icons.calendar_month_sharp, color: AppColors.white),
//                 value: _selectedDate,
//                 onChanged: (DateTime? newValue) {
//                   setState(() {
//                     if (newValue != null) {
//                       _selectedDate = newValue;
//                       fetchDashboardData(newValue);
//                     }
//                   });
//                 },
//                 items: _dates.map<DropdownMenuItem<DateTime>>((DateTime date) {
//                   return DropdownMenuItem<DateTime>(
//                     value: date,
//                     child: Text(
//                       DateFormat('yyyy-MM-dd').format(date),
//                       style: TextStyle(color: AppColors.white),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void fetchDashboardData(DateTime selectedDate) async {
//     try {
//       final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
//       final dashboardData = await widget.doctorRepository.fetchDoctorDashboard(widget.uId, formattedDate);
//       print('Dashboard Data: $dashboardData');
//       // Handle the fetched dashboard data here
//     } catch (error) {
//       print('Error fetching dashboard data: $error');
//       // Handle the error here
//     }
//   }
// }