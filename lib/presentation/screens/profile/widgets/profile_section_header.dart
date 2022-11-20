import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class ProfileSectionHeader extends StatelessWidget {
  final String title;
  final String leading;
  final IconData icon;
  const ProfileSectionHeader({
    Key? key, required this.title, required this.leading, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.5.sp,
            color: AppConstants().purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          leading,
          style: TextStyle(
            fontSize: 10.5.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        Container(
          height: 7.w,
          width: 7.w,
          padding: EdgeInsets.all(1.w),
          decoration: BoxDecoration(
            color: AppConstants().lightPurple,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppConstants().purple,
            size: 9.sp,
          ),
        ),
      ],
    );
  }
}
