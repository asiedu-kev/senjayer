import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class SettingSectionItem extends StatelessWidget {
  final String iconPath;
  final String sectionTitle;
  final VoidCallback onPressed;
  const SettingSectionItem({
    Key? key,
    required this.iconPath,
    required this.sectionTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: 1.h,
          bottom: 2.h,
        ),
        height: 7.h,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 14.w,
              width: 14.w,
              padding: EdgeInsets.symmetric(
                vertical: 2.h,
                horizontal: 4.3.w,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppConstants().lightPurple,
              ),
              child: Image.asset(
                iconPath,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              sectionTitle,
              style: TextStyle(
                fontSize: 12.5.sp,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
