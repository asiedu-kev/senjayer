import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class EditTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool isNecessary;
  final String suffixIconPath;
  final Color? color;
  const EditTextField(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.isNecessary,
      required this.suffixIconPath, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isNecessary)
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "*",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 7.sp,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        TextFormField(
          cursorColor: AppConstants().purple,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: Container(
              height: 3.w,
              width: 3.w,
              padding: EdgeInsets.symmetric(
                vertical: 3.w,
                horizontal: 4.w,
              ),
              child: Image.asset(
                suffixIconPath,
                color: color,
                fit: BoxFit.fill,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppConstants().purple,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppConstants().purple),
              borderRadius: BorderRadius.circular(40),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppConstants().purple),
              borderRadius: BorderRadius.circular(40),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppConstants().purple),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}
