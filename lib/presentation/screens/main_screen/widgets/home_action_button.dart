import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';


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
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(8.0),
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
