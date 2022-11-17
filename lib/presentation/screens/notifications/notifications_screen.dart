import 'package:flutter/material.dart';
import 'package:senjayer/data/models/notification.dart';
import 'package:senjayer/presentation/screens/notifications/widget/no_notification_widget.dart';
import 'package:senjayer/presentation/screens/notifications/widget/notification_card.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late bool hasNotification;
  @override
  void initState() {
    hasNotification = false;
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(const Duration(seconds: 5)).then(
      (value) => setState(() {
        hasNotification = true;
      }),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(
        title: "Notifications",
        leadingFunction: () {},
      ).build(context),
      body: !hasNotification
          ? const NoNotificationWidget()
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Aujourdhui, 31 Mars 2022",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    NotificationCard(
                      notification: notifiactions1[0],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    NotificationCard(
                      notification: notifiactions1[1],
                    ),
                    const Text(
                      "Mardi, 29 Mars 2022",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    NotificationCard(
                      notification: notifiactions2[0],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    NotificationCard(
                      notification: notifiactions2[1],
                    ),
                    const Text(
                      "Aujourdhui, 31 Mars 2022",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    NotificationCard(
                      notification: notifiactions1[0],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    NotificationCard(
                      notification: notifiactions1[1],
                    ),
                    const Text(
                      "Mardi, 29 Mars 2022",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    NotificationCard(
                      notification: notifiactions1[0],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    NotificationCard(
                      notification: notifiactions1[1],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}