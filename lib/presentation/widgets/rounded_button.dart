import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: 0,
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          40,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      color: AppConstants().purple,
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.values[5],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
