import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class ContactTextField extends StatelessWidget {
  final String title;
  final IconData? suffixIcon;
  final int? maxLength;
  final int? minLines;
  const ContactTextField(
      {Key? key,
      required this.title,
      this.suffixIcon,
      this.maxLength,
      this.minLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 1.h,),
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
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    " *",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 7.sp,
                    ),
                  ),
                ),
                if (maxLength != null) const Spacer(),
                if (maxLength != null)
                  Text(
                    "Max $maxLength mots",
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        TextFormField(
          maxLength: maxLength,
          minLines: minLines,
          maxLines: minLines !=null? minLines! * 2 : 1,
          cursorColor: AppConstants().purple,
          decoration: InputDecoration(
            contentPadding: maxLength != null? EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h,): null,
            counterText: '',
            hintText: title,
            suffixIcon: suffixIcon != null
                ? Icon(
                    suffixIcon,
                    color: Colors.grey,
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 1.h,),
      ],
    );
  }
}
