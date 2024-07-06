import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sopdas/Modules/patient/presintation/bloc/doctor_List.dar/list_bloc.dart';
import 'package:sopdas/Modules/patient/presintation/bloc/doctor_List.dar/list_state.dart';
import 'package:sopdas/core/colors/colores.dart';

class PatientDetailLoding extends StatelessWidget {
  

  const PatientDetailLoding(
      {super.key, });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.white70,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hallo!",
                              style: TextStyle(
                                fontSize:  24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                             'Name',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 30,
                        child: FlutterLogo(size: 50),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Card(
                    color: AppColors.dark,
                    elevation: 8,
                    child: SizedBox(
                      height: 45,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Doctor's List",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white),
                            ),
                            Icon(
                              Icons.filter_list,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: BlocBuilder<DoctorListBloc, DoctorListState>(
                      builder: (context, state) {
                        if (state is DoctorListLoading) {
                          return GridView.count(
                            crossAxisCount: 1,
                            childAspectRatio:
                                (1 / .4),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: List.generate(4, (index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                                  height: 100.0,
                                  color: Colors.white,
                                ),
                              );
                            }),
                          );
                        
                        } 
                        return const Center(child: Text('Unexpected state'));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
