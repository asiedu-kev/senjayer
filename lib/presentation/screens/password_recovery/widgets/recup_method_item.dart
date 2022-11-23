import 'package:flutter/material.dart';
import 'package:senjayer/data/enums/otp_method.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class RecupMethodItem extends StatelessWidget {
  final OTPMethod method;
  final String coordonate;
  final IconData icon;
  final VoidCallback onPressed;
  const RecupMethodItem({
    Key? key,
    required this.method,
    required this.coordonate,
    required this.icon, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 14.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 5.w,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppConstants().purple,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 18.w,
              width: 18.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppConstants().lightPurple,
              ),
              child: Icon(
                icon,
                color: AppConstants().purple,
                size: 22.sp,
              ),
            ),
             SizedBox(
              width: 2.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  method.toString(),
                  style: TextStyle(
                    fontSize: 10.sp,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  coordonate,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11.5.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
