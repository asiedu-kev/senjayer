import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:senjayer/data/models/ticket.dart';
import 'package:sizer/sizer.dart';

class TicketItem extends StatelessWidget {
  final Ticket ticket;
  const TicketItem({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(ticket.qrUrl);
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
            child: Image.network(
              ticket.qrUrl,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            ticket.name,
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
