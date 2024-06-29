// import 'package:flutter/material.dart';
// import 'package:project/Doctor_List/presentation/Module_Aip.dart/Module_api.dart';
// import 'package:project/Doctor_Screen/presentation/pages/Doctur_Home.dart';
// import 'package:project/theme/colors.dart';

// class PatientRecord extends StatelessWidget {
//   final Doctor doctor;
//   const PatientRecord({super.key, required this.doctor});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DocturHome(doctor: doctor),
//               ),
//             );
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             LayoutBuilder(
//               builder: (context, constraints) {
//                 bool isSmallScreen = constraints.maxWidth < 600;
//                 return Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8.0),
//                       child: SizedBox(
//                         height: isSmallScreen ? 70.0 : 140.0,
//                         width: isSmallScreen ? 70.0 : 140.0,
//                         child: Image.asset('assets/images/dos.jpg'),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Row(
//                             children: [
//                               Icon(
//                                 Icons.person_rounded,
//                                 color: AppColors.dark,
//                               ),
//                               SizedBox(width: 8),
//                               Text(
//                                 'Patient Name',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: AppColors.dark,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           const Row(
//                             children: [
//                               Icon(
//                                 Icons.circle_sharp,
//                                 color: AppColors.dark,
//                               ),
//                               SizedBox(width: 12),
//                               Text(
//                                 'Patient age',
//                                 style: TextStyle(color: AppColors.dark),
//                               ),
//                             ],
//                           ),
//                           const Text(
//                             'Issue description',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w700,
//                               color: AppColors.dark,
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           Text(
//                             'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
//                             style: TextStyle(
//                               color: Colors.grey[700],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//             const SizedBox(height: 26),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     CustomDropdown(
//                       title: 'Patient History',
//                       items: [
//                         DropdownItem('Blood report'),
//                         DropdownItem('CT Scan report'),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     CustomDropdown(
//                       title: 'Prescription',
//                       items: [
//                         DropdownItem('26 March 2022'),
//                         DropdownItem('13 April 2022'),
//                         DropdownItem('Add new', icon: Icons.add),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomDropdown extends StatefulWidget {
//   final String title;
//   final List<DropdownItem> items;

//   const CustomDropdown({super.key, required this.title, required this.items});

//   @override
//   // ignore: library_private_types_in_public_api
//   _CustomDropdownState createState() => _CustomDropdownState();
// }

// class _CustomDropdownState extends State<CustomDropdown> {
//   bool isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               isExpanded = !isExpanded;
//             });
//           },
//           child: Container(
//             color: AppColors.dark,
//             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   widget.title,
//                   style: const TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//                 Icon(
//                   isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         if (isExpanded)
//           Column(
//             children: widget.items.map((item) {
//               return Container(
//                 margin: const EdgeInsets.all(3.0),
//                 padding: const EdgeInsets.all(3.0),
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                       color: AppColors.dark,
//                     ),
//                     borderRadius:
//                         const BorderRadius.all(Radius.circular(10.0))),
//                 child: ListTile(
//                   title: Text(item.title),
//                   trailing: item.icon != null
//                       ? Icon(item.icon)
//                       : const Icon(Icons.visibility),
//                   onTap: () {
//                     // Handle tap
//                   },
//                 ),
//               );
//             }).toList(),
//           ),
//       ],
//     );
//   }
// }

// class DropdownItem {
//   final String title;
//   final IconData? icon;

//   DropdownItem(this.title, {this.icon});
// }

import 'package:flutter/material.dart';
import 'package:sopdas/Modules/doctor/data/models/Doctor_Dashbord_module.dart';
import 'package:sopdas/core/colors/colores.dart';

class PatientDetailPage extends StatelessWidget {
  final PatientList patient;

  const PatientDetailPage({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                bool isSmallScreen = constraints.maxWidth < 600;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SizedBox(
                        height: isSmallScreen ? 70.0 : 140.0,
                        width: isSmallScreen ? 70.0 : 140.0,
                        child: const FlutterLogo(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.person_rounded,
                                color: AppColors.dark,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Patient Name: ${patient.name}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.dark,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Icon(
                                Icons.circle_sharp,
                                color: AppColors.dark,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Patient age : ?',
                                style: TextStyle(color: AppColors.dark),
                              ),
                            ],
                          ),
                          const Text(
                            'Issue description',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.dark,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 26),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                     CustomDropdown(
                      title: 'Patient History',
                      items: [
                        DropdownItem('Blood report'),
                        DropdownItem('CT Scan report'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomDropdown(
                      title: 'Prescription',
                      items: [
                        DropdownItem('26 March 2022'),
                        DropdownItem('13 April 2022'),
                        DropdownItem('Add new', icon: Icons.add),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  final String title;
  final List<DropdownItem> items;

  const CustomDropdown({super.key, required this.title, required this.items});

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            color: AppColors.dark,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Icon(
                  isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Column(
            children: widget.items.map((item) {
              return Container(
                margin: const EdgeInsets.all(3.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.dark,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: ListTile(
                  title: Text(item.title),
                  trailing: item.icon != null
                      ? Icon(item.icon)
                      : const Icon(Icons.visibility),
                  onTap: () {
                    // Handle tap
                  },
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}

class DropdownItem {
  final String title;
  final IconData? icon;

  DropdownItem(this.title, {this.icon});
}
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Patient Name: ${patient.name}'),
//             Text('Slot Time: ${patient.slotTime}'),
//             Text('Treated: ${patient.treated ? "Yes" : "No"}'),
//             // Add more patient details here as needed
//           ],
//         ),
//       ),
//     );
//   }
// }

