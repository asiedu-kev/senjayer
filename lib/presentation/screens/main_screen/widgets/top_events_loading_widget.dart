import 'package:flutter/material.dart';
import 'package:senjayer/presentation/widgets/shimmer.dart';
import 'package:senjayer/presentation/widgets/shimmer_loading.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class TopEventsLoadingWidget extends StatelessWidget {
  const TopEventsLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      linearGradient:
          AppConstants().shimmerGradient,
      child: ShimmerLoading(
        isLoading: true,
        child: Container(
          height: 18.3.h,
          margin: EdgeInsets.symmetric(
              horizontal: 5.w),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(
              20,
            ),
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}