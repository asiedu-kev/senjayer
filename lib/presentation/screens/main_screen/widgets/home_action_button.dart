import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';


class HomeActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const HomeActionButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 9.w,
        width: 9.w,
        padding: EdgeInsets.all(1.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppConstants().lightPurple,
        ),
        child: Icon(
          icon,
          color: AppConstants().purple,
        ),
      ),
    );
  }
}
