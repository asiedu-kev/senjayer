import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ActivityCountItem extends StatelessWidget {
  final String title;
  final int count;
  const ActivityCountItem({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 20.5.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 10.5.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
