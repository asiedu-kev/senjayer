import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';

class NoNotificationWidget extends StatelessWidget {
  const NoNotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 170,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppConstants().lightPurple,
            ),
            child: Icon(
              Icons.notifications,
              color: AppConstants().purple,
              size: 80,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Vous n'avez pas de\nnotifications.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
          )
        ],
      ),
    );
  }
}
