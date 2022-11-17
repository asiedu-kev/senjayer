import 'package:flutter/material.dart';

import 'package:senjayer/utils/constants.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final String label;
  final VoidCallback onTap;
  const CategoryItem({
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
        height: 35,
        width: 90,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected? AppConstants().purple :Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: AppConstants().purple,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.values[5],
            color: isSelected? Colors.white : AppConstants().purple,
          ),
        ),
      ),
    );
  }
}
