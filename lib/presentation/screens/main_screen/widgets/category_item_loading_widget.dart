import 'package:flutter/material.dart';
import 'package:senjayer/presentation/widgets/shimmer.dart';
import 'package:senjayer/presentation/widgets/shimmer_loading.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class CategoryItemLoadingWidget extends StatelessWidget {
  const CategoryItemLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      linearGradient: AppConstants().shimmerGradient,
      child: ShimmerLoading(
        isLoading: true,
        child: Container(
          height: 4.5.h,
          width: 15.w,
          margin: EdgeInsets.symmetric(
            horizontal: 2.w,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}
