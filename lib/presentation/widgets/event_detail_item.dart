import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';

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
          size: 12,
          color: AppConstants().mediumPurple,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          data,
          style: const TextStyle(
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
