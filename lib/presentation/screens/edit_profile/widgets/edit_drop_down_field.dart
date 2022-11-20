import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class EditDropDownField extends StatelessWidget {
  final String title;
  final List<String> items;
  const EditDropDownField({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

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
            child: Text(
              title,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        DropdownButtonFormField<String>(
            decoration: InputDecoration(
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
            items: items
                .map((item) => DropdownMenuItem<String>(
                      child: Text(item),
                      value: item,
                    ))
                .toList(),
            onChanged: (_) {}),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}
