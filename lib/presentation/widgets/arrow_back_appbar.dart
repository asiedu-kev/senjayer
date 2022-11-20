import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class ArrowBackAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? actionFunction;
  const ArrowBackAppBar({
    Key? key,
    required this.title,
    this.actionFunction,
  }) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_outlined,
          color: AppConstants().purple,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.5.sp,
          fontWeight: FontWeight.values[5],
          color: Colors.black,
        ),
      ),
      actions: [
        if (actionFunction != null)
          GestureDetector(
            onTap: actionFunction,
            child: Container(
              margin: EdgeInsets.only(right: 3.w),
              height: 5.w,
              width: 5.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
              ),
              child: Icon(
                Icons.more_horiz,
                color: Colors.black,
                size: 14.sp,
              ),
            ),
          )
      ],
    );
  }
}
