import 'package:flutter/material.dart';
import 'package:senjayer/data/models/ticket.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class TicketItem extends StatelessWidget {
  final Ticket ticket;
  const TicketItem({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.8.h,
      padding: EdgeInsets.symmetric(
        horizontal: 3.w,
        vertical: 1.h,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 1.w,
      ),
      decoration: BoxDecoration(
        color: AppConstants().lightPurple,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ticket.name,
            style: TextStyle(
              fontSize: 11.5.sp,
            ),
          ),
          Text(
            "${ticket.price} F CFA",
            style: TextStyle(
              fontSize: 11.5.sp,
            ),
          ),
        ],
      ),
    );
  }
}
