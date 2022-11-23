import 'package:flutter/material.dart';
import 'package:senjayer/data/models/notification.dart' as nt;
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class NotificationCard extends StatelessWidget {
  final nt.Notification notification;
  const NotificationCard({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 1.h,
        ),
        height: 8.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 10.5.w,
              width: 10.5.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: notification.title == "Paiement accepté"
                    ? AppConstants().lightGreen
                    : notification.title == "Commande annulée"
                        ? AppConstants().lightRed
                        : AppConstants().lightyellow,
              ),
              child: Icon(
                 notification.title == "Paiement accepté"
                    ? Icons.check_circle : notification.title == "Commande annulée"
                        ? Icons.cancel : Icons.notifications,
                color: notification.title == "Paiement accepté"
                    ? AppConstants().green
                    : notification.title == "Commande annulée"
                        ? AppConstants().red
                        : AppConstants().yellow,
                size: 15.sp,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    notification.title,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    notification.content,
                    style: TextStyle(
                      fontSize: 7.5.sp,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
