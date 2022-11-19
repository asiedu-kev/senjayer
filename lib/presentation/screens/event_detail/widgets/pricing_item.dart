import 'package:flutter/material.dart';
import 'package:senjayer/data/models/pricing.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class PricingItem extends StatelessWidget {
  final Pricing pricing;
  const PricingItem({
    Key? key,
    required this.pricing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.8.h,
      padding: EdgeInsets.symmetric(
        horizontal: 3.w,
        vertical: 1.h,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 1.w,
      ),
      decoration: BoxDecoration(
        color: AppConstants().lightPurple,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            pricing.label,
            style: TextStyle(
              fontSize: 11.5.sp,
            ),
          ),
          Text(
            "${pricing.price} F CFA",
            style: TextStyle(
              fontSize: 11.5.sp,
            ),
          ),
        ],
      ),
    );
  }
}
