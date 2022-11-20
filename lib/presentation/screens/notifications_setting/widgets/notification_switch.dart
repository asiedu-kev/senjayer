import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class NotificationSwitch extends StatelessWidget {
  final String title;
  final bool value;
  const NotificationSwitch({
    Key? key, required this.title, required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 1.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12.5.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            CupertinoSwitch(
              value: value,
              onChanged: (_) {},
              activeColor: AppConstants().purple,
            ),
          ],
        ),
        SizedBox(height: 1.h,),
      ],
    );
  }
}
