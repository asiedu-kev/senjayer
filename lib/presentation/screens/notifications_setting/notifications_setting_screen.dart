import 'package:flutter/material.dart';
import 'package:senjayer/presentation/screens/notifications_setting/widgets/notification_switch.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:sizer/sizer.dart';

class NotificationsSettingScreen extends StatelessWidget {
  const NotificationsSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ArrowBackAppBar(title: "Notifications").build(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: const [
                NotificationSwitch(title: "Notifications sonores", value: true),
                Divider(),
                NotificationSwitch(title: "Mises à jour favoris", value: true),
                Divider(),
                NotificationSwitch(title: "Mises à jour acteurs suivis", value: true),
                Divider(),
                NotificationSwitch(title: "Commentaires - Message", value: false),
                Divider(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}