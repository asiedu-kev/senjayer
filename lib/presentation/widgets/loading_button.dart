import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class LoadingButton extends StatelessWidget {
  final Color? color;
  final double? height;
  const LoadingButton({
    Key? key,
    this.color,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppConstants().purple,
        borderRadius: BorderRadius.circular(
          40,
        ),
      ),
      child: Row(
        children: [
          Spacer(),
          SizedBox(
            height: 5.w,
            width: 5.w,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          Spacer()
        ],
      ),
    )
        /* MaterialButton(
      onPressed: null,
      elevation: 0,
      height: height ?? 6.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          40,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      color: color ?? AppConstants().purple,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 6.h,
              width: 6.h,
              child: const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    ) */
        ;
  }
}
