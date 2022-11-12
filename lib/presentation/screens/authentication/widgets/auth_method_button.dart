import 'package:flutter/material.dart';
import 'package:senjayer/data/models/auth_method.dart';

class AuthMethodButton extends StatelessWidget {
  final AuthMethod authMethod;
  const AuthMethodButton({
    Key? key,
    required this.authMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 45,
              width: 45,
              child: Image.asset(
                authMethod.imagePath,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              authMethod.name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
