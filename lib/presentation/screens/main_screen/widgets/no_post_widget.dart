import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class NoPostWidget extends StatelessWidget {
  const NoPostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40.w,
            width: 40.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppConstants().lightPurple,
            ),
            child: Icon(
              Icons.newspaper,
              color: AppConstants().purple,
              size: 60.sp,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "Aucun post pour le moment",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 17.5.sp,
                  fontWeight: FontWeight.bold,
                ),
          )
        ],
      ),
    );
  }
}
