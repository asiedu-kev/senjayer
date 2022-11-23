import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class InterestCenterChip extends StatelessWidget {
  final String interestCenter;
  const InterestCenterChip({
    Key? key,
    required this.interestCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 1.h,
        horizontal: 5.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppConstants().purple,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        interestCenter,
        style: TextStyle(
          fontSize: 13.sp,
          color: AppConstants().purple,
        ),
      ),
    );
  }
}
