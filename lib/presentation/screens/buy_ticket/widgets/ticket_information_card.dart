import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class TicketInformationCard extends StatelessWidget {
  const TicketInformationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 1.5.h,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 3.h,
        horizontal: 5.w,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppConstants().lightPurple,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ticket',
            style: TextStyle(
              fontSize: 13.5.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            'Nom',
            style: TextStyle(
              fontSize: 11.5.sp,
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Container(
            height: 4.5.h,
            width: double.infinity,
            color: Colors.white,
            child: TextField(
              cursorColor: AppConstants().purple,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            'Prénom(s)',
            style: TextStyle(
              fontSize: 11.5.sp,
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Container(
            height: 4.5.h,
            width: double.infinity,
            color: Colors.white,
            child: TextField(
              cursorColor: AppConstants().purple,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            'Adresse mail',
            style: TextStyle(
              fontSize: 11.5.sp,
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Container(
            height: 4.5.h,
            width: double.infinity,
            color: Colors.white,
            child: TextField(
              cursorColor: AppConstants().purple,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            'Numéro de téléphone',
            style: TextStyle(
              fontSize: 11.5.sp,
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Container(
            height: 4.5.h,
            width: double.infinity,
            color: Colors.white,
            child: TextField(
              cursorColor: AppConstants().purple,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
