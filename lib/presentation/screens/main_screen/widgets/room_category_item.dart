import 'package:flutter/material.dart';

import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class RoomCategoryItem extends StatelessWidget {
  final bool isSelected;
  final String label;
  final VoidCallback onTap;
  const RoomCategoryItem({
    Key? key,
    required this.isSelected,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 4.5.h,
        padding: EdgeInsets.symmetric(
          vertical: 1.h,
          horizontal: 5.w,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 2.w,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppConstants().purple : AppConstants().grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
