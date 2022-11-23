import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class BottomNavBarItem extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;
  final bool isSelected;
  const BottomNavBarItem({
    Key? key,
    required this.iconPath,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 11.5.w,
        width: 11.5.w,
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              isSelected ? AppConstants().purple : AppConstants().lightPurple,
        ),
        child: Image.asset(
          iconPath,
        ),
      ),
    );
  }
}
