import 'package:flutter/material.dart';
import 'package:senjayer/presentation/widgets/shimmer_loading.dart';
import 'package:sizer/sizer.dart';

class HallLoadingCard extends StatelessWidget {
  const HallLoadingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: true,
      child: Container(
          height: 19.h,
          width: 30.w,
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
      ),
    );
  }
}
