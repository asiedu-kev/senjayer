import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/cubit/category_cubit.dart';
import 'package:senjayer/business_logic/cubit/main_screen_cubit.dart';
import 'package:senjayer/business_logic/cubit/search_cubit.dart';
import 'package:senjayer/presentation/screens/main_screen/pages/home_page.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/bottom_nav_bar_item.dart';

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
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CategoryCubit(),
              ),
              BlocProvider(
                create: (context) => SearchCubit(),
              ),
            ],
            child: HomePage(),
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.orange,
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
        height: 96,
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
