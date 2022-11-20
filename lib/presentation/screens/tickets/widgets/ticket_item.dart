import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TicketItem extends StatelessWidget {
  const TicketItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.w,
      width: 35.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35.w,
            width: 35.w,
            child: Image.asset(
              "assets/images/QRCode.png",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 1.h,),
          Text(
            "Bobo show",
            textAlign: TextAlign.left,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.5.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
