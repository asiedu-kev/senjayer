import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/bloc/category_bloc/categories_bloc.dart';
import 'package:senjayer/business_logic/cubit/category/category_cubit.dart';
import 'package:senjayer/business_logic/cubit/day_events/day_events_cubit.dart';
import 'package:senjayer/business_logic/cubit/main_screen/main_screen_cubit.dart';
import 'package:senjayer/business_logic/cubit/post/post_cubit.dart';
import 'package:senjayer/business_logic/cubit/room_category/room_category_cubit.dart';
import 'package:senjayer/business_logic/cubit/search/search_cubit.dart';
import 'package:senjayer/business_logic/cubit/top_events/top_events_cubit.dart';
import 'package:senjayer/business_logic/cubit/topic/topic_cubit.dart';
import 'package:senjayer/business_logic/cubit/trend/trend_cubit.dart';
import 'package:senjayer/presentation/screens/main_screen/pages/actor_page.dart';
import 'package:senjayer/presentation/screens/main_screen/pages/home_page.dart';
import 'package:senjayer/presentation/screens/main_screen/pages/location_page.dart';
import 'package:senjayer/presentation/screens/main_screen/pages/posts_page.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/bottom_nav_bar_item.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/home_action_button.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              5.w,
              MediaQuery.of(context).padding.top + 2.h,
              5.w,
              0,
            ),
            child: Row(
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
                  "Senjayer",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 10.5.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                HomeActionButton(
                  icon: Icons.notifications,
                  onTap: () =>
                      Navigator.of(context).pushNamed("/notifications"),
                ),
                SizedBox(
                  width: 3.w,
                ),
                HomeActionButton(
                  icon: Icons.bookmark,
                  onTap: () => Navigator.of(context).pushNamed("/favorites"),
                ),
                SizedBox(
                  width: 3.w,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed("/profile"),
                  child: Container(
                    height: 9.w,
                    width: 9.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile_picture.png"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => CategoryCubit(
                          categoriesBloc:
                              BlocProvider.of<CategoriesBloc>(context))
                        ..fetchCategories(),
                    ),
                    BlocProvider(
                      create: (context) => SearchCubit(),
                    ),
                    BlocProvider(
                      create: (context) => TopEventsCubit()..getTopEvents(),
                    ),
                    BlocProvider(
                      create: (context) => TrendCubit()..getTrendEvents(),
                    ),
                    BlocProvider(
                      create: (context) => DayEventsCubit()..getDayEvents(),
                    ),
                  ],
                  child: const HomePage(),
                ),
                MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => TopicCubit(),
                    ),
                    BlocProvider(
                      create: (context) => PostCubit()..getPosts(),
                    ),
                  ],
                  child: const PostsPage(),
                ),
                Container(
                  color: Colors.purple,
                ),
                MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => RoomCategoryCubit(),
                    ),
                    BlocProvider(
                      create: (context) => TopicCubit(),
                    ),
                  ],
                  child: const LocationPage(),
                ),
                const ActorsPage(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -1),
              blurRadius: 4,
              color: Colors.grey.withOpacity(0.5),
            )
          ],
        ),
        height: 10.h,
        child: BlocBuilder<MainScreenCubit, MainScreenState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: state.menuIconsPath
                  .map(
                    (navBarIconPath) => BottomNavBarItem(
                      iconPath: navBarIconPath,
                      isSelected: state.menuIconsPath.indexOf(navBarIconPath) ==
                          state.pageIndex,
                      onTap: () {
                        BlocProvider.of<MainScreenCubit>(context).changePage(
                          state.menuIconsPath.indexOf(navBarIconPath),
                          _pageController,
                        );
                      },
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
