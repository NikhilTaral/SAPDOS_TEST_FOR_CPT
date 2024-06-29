import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sopdas/Modules/book_Appointment_slot/data/models/slot_booking.dart';
import 'package:sopdas/Modules/patient/data/models/Doctor_List_model.dart';
import 'package:sopdas/Modules/patient/data/models/patient_model.dart';
import 'package:sopdas/Modules/payment/data/models/booking_model.dart';
import 'package:sopdas/Modules/payment/data/repositories/payment_repo_imp.dart';

import 'package:http/http.dart' as http;
import 'package:sopdas/Modules/payment/domin/repositories/appintment_repo.dart';
import 'package:sopdas/Modules/payment/domin/usecases/payment_usecases.dart';
import 'package:sopdas/Modules/payment/presintaton/bloc/book_bloc.dart';
import 'package:sopdas/Modules/payment/presintaton/bloc/book_event.dart';
import 'package:sopdas/Modules/payment/presintaton/bloc/book_state.dart';
import 'package:sopdas/core/colors/colores.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatefulWidget {
  final TimeSlot selectedSlot;
  final Doctor doctor;
  final PatientModel patient;

  const PaymentScreen(
      {super.key,
      required this.selectedSlot,
      required this.doctor,
      required this.patient});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  dynamic _selectedMethod;
  final List<String> _paymentMethods = ['Card', 'Net Banking', 'UPI'];
  // final String _patientUId =
  //     "example-patient-uid";

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isLargeScreen = screenWidth > 800;

    return BlocProvider(
      create: (context) => AppointmentBloc(
          BookAppointmentUseCase(AppointmentRepositoryImpl(http.Client() as AppointmentRepositoryImpl) as AppointmentRepository)),
      child: BlocConsumer<AppointmentBloc, AppointmentState>(
        listener: (context, state) {
          if (state is AppointmentSuccess) {
            showAlertDialog(context, "Booking confirmed!");
          } else if (state is AppointmentFailure) {
            showAlertDialog(context, "Booking failed. Please try again.");
          }
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              body: Container(
                color: AppColors.light,
                child: Row(
                  children: [
                    if (isLargeScreen)
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Image.asset('assets/index.png'),
                        ),
                      ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: SizedBox(
                          width: screenWidth,
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                              ),
                            ),
                            elevation: 4.0,
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "SAPDOS",
                                    style: TextStyle(
                                      fontSize: 58,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.dark,
                                    ),
                                  ),
                                  const SizedBox(height: 46),
                                  const Text(
                                    "Book Appointment",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.dark,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  // Text(
                                  //   'Selected Slot: ${widget.selectedSlot}',
                                  //   style: const TextStyle(fontSize: 18),
                                  // ),
                                  // const SizedBox(height: 10),
                                  // Text(
                                  //   'Doctor: ${widget.doctor.name}',
                                  //   style: const TextStyle(fontSize: 18),
                                  // ),
                                  // const SizedBox(height: 10),
                                  // Text(
                                  //   'Specialization: ${widget.doctor.specialization}',
                                  //   style: const TextStyle(fontSize: 18),
                                  // ),
                                  // const SizedBox(height: 20),
                                  SizedBox(
                                    width: 290,
                                    child: DropdownButtonFormField<String>(
                                      value: _selectedMethod,
                                      decoration: const InputDecoration(
                                        labelText: 'Payment Method',
                                        border: OutlineInputBorder(),
                                      ),
                                      items:
                                          _paymentMethods.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedMethod = newValue;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Select the mode of payment you prefer',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 16),
                                  if (_selectedMethod == 'Card') ...[
                                    const Text(
                                      'Enter your details below',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      width: 300,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Card Number',
                                          border: OutlineInputBorder(),
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      width: 300,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child: Expanded(
                                              child: TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'Card Holder',
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          SizedBox(
                                            width: 90,
                                            child: Expanded(
                                              child: TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'MM/YY',
                                                  border: OutlineInputBorder(),
                                                ),
                                                keyboardType:
                                                    TextInputType.datetime,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'CVV',
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 32),
                                    SizedBox(
                                      width: 230,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          final appointmentDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(DateTime.now());
                                          final appointment = AppointmentRequest (
                                            patientUId: widget.patient.uId,
                                            doctorUId: widget.doctor.uId,
                                            appointmentDate: appointmentDate,
                                            appointmentTime:
                                                widget.selectedSlot.time,
                                          );

                                          context.read<AppointmentBloc>().add(
                                              BookAppointmentEvent(appointment,));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.dark,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        child: const Text(
                                          'Pay Now',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 32),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void showAlertDialog(BuildContext context, String message) {
  AlertDialog alert = AlertDialog(
    backgroundColor: AppColors.dark,
    icon: const Icon(
      Icons.phone_android_sharp,
      color: AppColors.white,
      size: 30,
    ),
    content: Text(
      message,
      style: const TextStyle(
          color: AppColors.white, fontSize: 30, fontWeight: FontWeight.w300),
    ),
    actions: const [],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sopdas/Modules/payment/data/models/booking_model.dart';
// import 'package:sopdas/Modules/payment/data/repositories/payment_repo_imp.dart';
// import 'package:sopdas/Modules/payment/domin/repositories/appintment_repo.dart';
// import 'package:sopdas/Modules/payment/domin/usecases/payment_usecases.dart';
// import 'package:sopdas/Modules/payment/presintaton/bloc/book_bloc.dart';
// import 'package:sopdas/Modules/payment/presintaton/bloc/book_event.dart';
// import 'package:sopdas/Modules/payment/presintaton/bloc/book_state.dart';
// import 'package:sopdas/Modules/book_Appointment_slot/data/models/slot_booking.dart';
// import 'package:sopdas/Modules/patient/data/models/Doctor_List_model.dart';
// import 'package:sopdas/Modules/patient/data/models/patient_model.dart';
// import 'package:sopdas/core/colors/colores.dart';
// import 'package:intl/intl.dart';

// import 'package:http/http.dart' as http;

// class PaymentScreen extends StatefulWidget {
//   final TimeSlot selectedSlot;
//   final Doctor doctor;
//   final PatientModel patient;

//   const PaymentScreen({
//     super.key,
//     required this.selectedSlot,
//     required this.doctor,
//     required this.patient,
//   });

//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   dynamic _selectedMethod;
//   final List<String> _paymentMethods = ['Card', 'Net Banking', 'UPI'];

//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     var isLargeScreen = screenWidth > 800;

//     return BlocProvider(
//       create: (context) => AppointmentBloc(
//         BookAppointmentUseCase(AppointmentRepositoryImpl(http.Client() as AppointmentRepositoryImpl) as AppointmentRepository),
//       ),
//       child: BlocConsumer<AppointmentBloc, AppointmentState>(
//         listener: (context, state) {
//           if (state is AppointmentSuccess) {
//             showAlertDialog(context, "Booking confirmed!");
//           } else if (state is AppointmentFailure) {
//             showAlertDialog(context, "Booking failed. Please try again.");
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(
//               centerTitle: true,
//               leading: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(Icons.arrow_back),
//               ),
//             ),
//             body: Container(
//               color: AppColors.light,
//               child: Row(
//                 children: [
//                   if (isLargeScreen)
//                     Expanded(
//                       flex: 2,
//                       child: Center(
//                         child: Image.asset('assets/index.png'),
//                       ),
//                     ),
//                   Expanded(
//                     flex: 3,
//                     child: Center(
//                       child: Container(
//                         width: screenWidth,
//                         child: Card(
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(24),
//                               bottomLeft: Radius.circular(24),
//                             ),
//                           ),
//                           elevation: 4.0,
//                           child: Padding(
//                             padding: const EdgeInsets.all(32.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   "SAPDOS",
//                                   style: TextStyle(
//                                     fontSize: 58,
//                                     fontWeight: FontWeight.w900,
//                                     color: AppColors.dark,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 46),
//                                 const Text(
//                                   "Book Appointment",
//                                   style: TextStyle(
//                                     fontSize: 28,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColors.dark,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 SizedBox(
//                                   width: 290,
//                                   child: DropdownButtonFormField<String>(
//                                     value: _selectedMethod,
//                                     decoration: const InputDecoration(
//                                       labelText: 'Payment Method',
//                                       border: OutlineInputBorder(),
//                                     ),
//                                     items: _paymentMethods.map((String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(value),
//                                       );
//                                     }).toList(),
//                                     onChanged: (String? newValue) {
//                                       setState(() {
//                                         _selectedMethod = newValue;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 const Text(
//                                   'Select the mode of payment you prefer',
//                                   style: TextStyle(color: Colors.grey),
//                                 ),
//                                 const SizedBox(height: 16),
//                                 if (_selectedMethod == 'Card') ...[
//                                   const Text(
//                                     'Enter your details below',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   const SizedBox(height: 16),
//                                   SizedBox(
//                                     width: 300,
//                                     child: TextFormField(
//                                       decoration: const InputDecoration(
//                                         labelText: 'Card Number',
//                                         border: OutlineInputBorder(),
//                                       ),
//                                       keyboardType: TextInputType.number,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 16),
//                                   SizedBox(
//                                     width: 300,
//                                     child: Row(
//                                       children: [
//                                         SizedBox(
//                                           width: 120,
//                                           child: TextFormField(
//                                             decoration: const InputDecoration(
//                                               labelText: 'Card Holder',
//                                               border: OutlineInputBorder(),
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(width: 16),
//                                         SizedBox(
//                                           width: 90,
//                                           child: TextFormField(
//                                             decoration: const InputDecoration(
//                                               labelText: 'MM/YY',
//                                               border: OutlineInputBorder(),
//                                             ),
//                                             keyboardType:
//                                                 TextInputType.datetime,
//                                           ),
//                                         ),
//                                         const SizedBox(width: 16),
//                                         Expanded(
//                                           child: TextFormField(
//                                             decoration: const InputDecoration(
//                                               labelText: 'CVV',
//                                               border: OutlineInputBorder(),
//                                             ),
//                                             keyboardType: TextInputType.number,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 32),
//                                   SizedBox(
//                                     width: 230,
//                                     height: 40,
//                                     child: ElevatedButton(
//                                       onPressed: () {
//                                         final appointmentDate =
//                                             DateFormat('yyyy-MM-dd')
//                                                 .format(DateTime.now());
//                                         final appointment = AppointmentRequest(
//                                           patientUId: widget.patient.uId,
//                                           doctorUId: widget.doctor.uId,
//                                           appointmentDate: appointmentDate,
//                                           appointmentTime:
//                                               widget.selectedSlot.time,
//                                         );

//                                         context.read<AppointmentBloc>().add(
//                                               BookAppointmentEvent(
//                                                 appointment,
//                                               ),
//                                             );
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: AppColors.dark,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(8.0),
//                                         ),
//                                       ),
//                                       child: const Text(
//                                         'Pay Now',
//                                         style: TextStyle(
//                                             fontSize: 16, color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 32),
//                                 ],
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// void showAlertDialog(BuildContext context, String message) {
//   AlertDialog alert = AlertDialog(
//     backgroundColor: AppColors.dark,
//     icon: const Icon(
//       Icons.phone_android_sharp,
//       color: AppColors.white,
//       size: 30,
//     ),
//     content: Text(
//       message,
//       style: const TextStyle(
//           color: AppColors.white, fontSize: 30, fontWeight: FontWeight.w300),
//     ),
//     actions: const [],
//   );

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
