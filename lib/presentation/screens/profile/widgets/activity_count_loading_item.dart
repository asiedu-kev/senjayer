import 'package:flutter/material.dart';
import 'package:senjayer/presentation/widgets/shimmer.dart';
import 'package:senjayer/presentation/widgets/shimmer_loading.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class ActivityCountLoadingItem extends StatelessWidget {
  const ActivityCountLoadingItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      linearGradient: AppConstants().shimmerGradient,
      child: ShimmerLoading(
        isLoading: true,
        child: Column(
          children: [
            Container(
              height: 6.h,
              width: 15.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
            ),
            SizedBox(height: 0.5.h,),
            Container(
              height: 2.h,
              width: 25.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
