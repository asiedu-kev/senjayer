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
          const Spacer(),
          SizedBox(
            height: 5.w,
            width: 5.w,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
