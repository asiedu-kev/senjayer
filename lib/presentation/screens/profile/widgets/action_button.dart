import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  const ActionButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 9.w,
        width: 9.w,
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppConstants().lightPurple,
        ),
        child: Image.asset(
          "assets/icons/setting.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
