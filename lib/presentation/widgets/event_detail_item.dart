import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class EventDetailItem extends StatelessWidget {
  final IconData icon;
  final String data;
  const EventDetailItem({
    Key? key,
    required this.icon,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 9.sp,
          color: AppConstants().mediumPurple,
        ),
        SizedBox(
          width: 1.h,
        ),
        Text(
          data,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 9.sp,
          ),
        )
      ],
    );
  }
}
