import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TicketItem extends StatelessWidget {
  const TicketItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17.h,
      width: 25.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25.w,
            width: 25.w,
            child: Image.asset(
              "assets/images/QRCode.png",
              fit: BoxFit.fill,
            ),
          ),
          Text(
            "Bobo show",
            textAlign: TextAlign.left,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11.5.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
