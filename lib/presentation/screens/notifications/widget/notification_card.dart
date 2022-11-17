import 'package:flutter/material.dart';
import 'package:senjayer/data/models/notification.dart' as nt;
import 'package:senjayer/utils/constants.dart';

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
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
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
                size: 22,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    notification.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    notification.content,
                    style: const TextStyle(
                      fontSize: 10,
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
