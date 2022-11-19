import 'package:flutter/material.dart';
import 'package:senjayer/data/models/auth_method.dart';
import 'package:sizer/sizer.dart';

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
        height: 21.w,
        width: 21.w,
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
              height: 10.5.w,
              width: 10.5.w,
              child: Image.asset(
                authMethod.imagePath,
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Text(
              authMethod.name,
              style: TextStyle(
                fontSize: 8.5.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
