import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/cubit/following/actors_followed_by_user_cubit.dart';
import 'package:senjayer/business_logic/cubit/user/user_cubit.dart';
import 'package:senjayer/business_logic/cubit/user_tickets/user_tickets_cubit.dart';
import 'package:senjayer/presentation/screens/profile/widgets/activity_count_item.dart';
import 'package:senjayer/presentation/screens/profile/widgets/activity_count_loading_item.dart';
import 'package:senjayer/presentation/screens/profile/widgets/interest_center_chip.dart';
import 'package:senjayer/presentation/screens/profile/widgets/action_button.dart';
import 'package:senjayer/presentation/screens/profile/widgets/profile_section_header.dart';
import 'package:senjayer/presentation/screens/profile/widgets/ticket_item.dart';
import 'package:senjayer/presentation/screens/profile/widgets/user_info_loading_widget.dart';
import 'package:senjayer/presentation/widgets/shimmer.dart';
import 'package:senjayer/presentation/widgets/shimmer_loading.dart';
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
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    if (state is UserFetched) {
                      return Column(
                        children: [
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
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: state.user.imageUrl != null
                                        ? DecorationImage(
                                            image: NetworkImage(
                                                state.user.imageUrl!),
                                            fit: BoxFit.fill,
                                          )
                                        : const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/profile_picture.png"),
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
                            state.user.name /* "Petit Dèkpè" */,
                            style: TextStyle(
                              fontSize: 20.5.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const UserInfoLoadingWidget();
                    }
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    const Spacer(),
                    BlocBuilder<ActorsFollowedByUserCubit,
                        ActorsFollowedByUserState>(
                      builder: (context, state) {
                        if (state is ActorsFollowedByUserFetched) {
                          return ActivityCountItem(
                            count: state.actorsFollowedByUserActors.length,
                            title: "Acteurs suivis",
                          );
                        } else {
                          return const ActivityCountLoadingItem();
                        }
                      },
                    ),
                    SizedBox(
                      height: 5.h,
                      child: VerticalDivider(
                        color: Colors.grey,
                        width: 25.w,
                      ),
                    ),
                    const ActivityCountItem(
                      count: 8,
                      title: "Evenements",
                    ),
                    const Spacer(),
                  ],
                ),
                const Divider(),
                SizedBox(height: 3.h),
                BlocBuilder<UserTicketsCubit, UserTicketsState>(
                  builder: (context, state) {
                    if (state is UserTicketsFetched) {
                      if (state.userTickets.isEmpty) {
                        return const SizedBox();
                      } else {
                        return Column(
                          children: [
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
                                itemBuilder: (context, index) => TicketItem(
                                    ticket: state.userTickets[index]),
                                itemCount: state.userTickets.length,
                              ),
                            ),
                          ],
                        );
                      }
                    }
                    return const LoadingTicketsSection();
                  },
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

class LoadingTicketsSection extends StatelessWidget {
  const LoadingTicketsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      linearGradient: AppConstants().shimmerGradient,
      child: ShimmerLoading(
        isLoading: true,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  height: 2.h,
                  width: 15.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5.w),
                  height: 2.h,
                  width: 15.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 17.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  height: 17.h,
                  width: 25.w,
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
