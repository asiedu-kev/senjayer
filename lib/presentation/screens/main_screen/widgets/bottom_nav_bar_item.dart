import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';

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
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(8.0),
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
