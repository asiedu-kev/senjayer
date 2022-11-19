import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class TopicItem extends StatelessWidget {
  final String topic;
  final bool isSelected;
  final VoidCallback onTap;
  const TopicItem({
    Key? key,
    required this.topic,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        topic,
        style: TextStyle(
          fontSize: 9.5.sp,
          color: isSelected ? AppConstants().purple : Colors.grey,
        ),
      ),
    );
  }
}
