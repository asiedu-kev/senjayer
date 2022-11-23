import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/bloc/auth_bloc/auth.dart';
import 'package:senjayer/presentation/screens/settings/widgets/setting_section_item.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ArrowBackAppBar(title: 'Paramètres').build(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            5.w,
            2.h,
            5.w,
            0,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const Divider(),
                SettingSectionItem(
                  iconPath: "assets/icons/user_icon.png",
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/editProfile"),
                  sectionTitle: "Editer le profile",
                ),
                const Divider(),
                SettingSectionItem(
                  iconPath: "assets/icons/ticket.png",
                  onPressed: () => Navigator.of(context).pushNamed("/tickets"),
                  sectionTitle: "Tickets achetés",
                ),
                const Divider(),
                SettingSectionItem(
                  iconPath: "assets/icons/notifications.png",
                  onPressed: () =>
                      Navigator.of(context).pushNamed("/notificationsSetting"),
                  sectionTitle: "Notifications",
                ),
                const Divider(),
                SettingSectionItem(
                  iconPath: "assets/icons/faq.png",
                  onPressed: () => Navigator.of(context).pushNamed("/faq"),
                  sectionTitle: "FAQ",
                ),
                const Divider(),
                SettingSectionItem(
                  iconPath: "assets/icons/about.png",
                  onPressed: () => Navigator.of(context).pushNamed("/aboutUs"),
                  sectionTitle: "A propos de senjayer",
                ),
                const Divider(),
                SettingSectionItem(
                  iconPath: "assets/icons/logout.png",
                  onPressed: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      context: context,
                      builder: (context) => Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                        ),
                        height: 30.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 12.w,
                              width: 12.w,
                              child: Image.asset(
                                "assets/icons/logout.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Text(
                              "Voulez - vous vraiment vous déconnecter ?",
                              style: TextStyle(
                                fontSize: 11.5.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.w,
                                    ),
                                    child: RoundedButton(
                                        onPressed: () {
                                          BlocProvider.of<AuthenticationBloc>(
                                                  context)
                                              .add(LoggedOut());
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        },
                                        label: "Quitter"),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5.w,
                                      ),
                                      child: MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        elevation: 0,
                                        height: 6.h,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            40,
                                          ),
                                        ),
                                        color: Colors.white,
                                        child: Container(
                                          height: 6.h,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppConstants().purple),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "Annuler",
                                                  style: TextStyle(
                                                    fontSize: 13.5.sp,
                                                    color:
                                                        AppConstants().purple,
                                                    fontWeight:
                                                        FontWeight.values[5],
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  sectionTitle: "Se déconnecter",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
