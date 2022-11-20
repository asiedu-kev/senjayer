import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:senjayer/presentation/screens/profile/widgets/activity_count_item.dart';
import 'package:senjayer/presentation/screens/profile/widgets/interest_center_chip.dart';
import 'package:senjayer/presentation/screens/profile/widgets/action_button.dart';
import 'package:senjayer/presentation/screens/profile/widgets/profile_section_header.dart';
import 'package:senjayer/presentation/screens/profile/widgets/ticket_item.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            5.w,
            MediaQuery.of(context).padding.top + 2.h,
            5.w,
            0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 8.3.w,
                      width: 8.3.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/icons/app_icon.png",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Mon profil",
                      style: TextStyle(
                        color: AppConstants().purple,
                        fontSize: 17.5.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    ActionButton(
                      onTap: () => Navigator.of(context).pushNamed("/settings"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  height: 30.w,
                  width: 30.w,
                  child: Stack(
                    children: [
                      Container(
                        height: 30.w,
                        width: 30.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image:
                                AssetImage("assets/images/profile_picture.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 1.h,
                        right: 0,
                        child: Container(
                          height: 7.w,
                          width: 7.w,
                          decoration: BoxDecoration(
                            color: AppConstants().lightPurple,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 10.sp,
                            color: AppConstants().purple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Petit Dèkpè",
                  style: TextStyle(
                    fontSize: 20.5.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    const Spacer(),
                    const ActivityCountItem(count: 13, title: "Acteurs suivis"),
                    SizedBox(
                        height: 5.h,
                        child: VerticalDivider(
                          color: Colors.grey,
                          width: 25.w,
                        )),
                    const ActivityCountItem(count: 8, title: "Evenements"),
                    const Spacer(),
                  ],
                ),
                const Divider(),
                SizedBox(height: 3.h),
                const ProfileSectionHeader(
                  title: "Achats",
                  leading: "Voir tout",
                  icon: Icons.visibility,
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 17.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => TicketItem(),
                    itemCount: 5,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const ProfileSectionHeader(
                  title: "Intèrêts",
                  leading: "Ajouter plus",
                  icon: Icons.edit,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 3.w,
                  runSpacing: 2.w,
                  children: [
                    "Show",
                    "Expo",
                    "Concert",
                    "Gala",
                  ]
                      .map(
                        (interestCenter) => InterestCenterChip(
                          interestCenter: interestCenter,
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}