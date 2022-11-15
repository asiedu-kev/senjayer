import 'package:flutter/material.dart';
import 'package:senjayer/data/enums/otp_method.dart';
import 'package:senjayer/utils/constants.dart';

class RecupMethodItem extends StatelessWidget {
  final OTPMethod method;
  final String coordonate;
  final IconData icon;
  final VoidCallback onPressed;
  const RecupMethodItem({
    Key? key,
    required this.method,
    required this.coordonate,
    required this.icon, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 128,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 23,
          vertical: 26,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppConstants().purple,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 76,
              width: 76,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppConstants().lightPurple,
              ),
              child: Icon(
                icon,
                color: AppConstants().purple,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  method.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  coordonate,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
