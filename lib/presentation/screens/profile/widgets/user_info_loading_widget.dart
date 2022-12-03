import 'package:flutter/material.dart';
import 'package:senjayer/presentation/widgets/shimmer.dart';
import 'package:senjayer/presentation/widgets/shimmer_loading.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class UserInfoLoadingWidget extends StatelessWidget {
  const UserInfoLoadingWidget({
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
            SizedBox(
              height: 4.h,
            ),
            Container(
              height: 30.w,
              width: 30.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 2.5.h,
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
