import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sopdas/core/colors/colores.dart';

class TimeSlotGridLoding extends StatelessWidget {
  const TimeSlotGridLoding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width < 600 ? 1 : 3,
        childAspectRatio: 8,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade400,
          highlightColor: Colors.white,
          child: Container(
            color: AppColors.light,
            child: const GridTile(
              child: ListTile(
                title: Text(
                  '',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
