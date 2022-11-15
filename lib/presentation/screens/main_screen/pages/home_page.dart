import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/cubit/category_cubit.dart';
import 'package:senjayer/data/models/event_list.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/category_item.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/event_list_widget.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/home_action_button.dart';
import 'package:senjayer/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
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
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Senjayer",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(),
                    HomeActionButton(
                      icon: Icons.notifications,
                      onTap: () => Navigator.of(context).pushNamed("/notifications"),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    HomeActionButton(
                      icon: Icons.bookmark,
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/profile_picture.png"),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        cursorColor: AppConstants().purple,
                        decoration: InputDecoration(
                          fillColor: AppConstants().lightPurple,
                          filled: true,
                          hintText: "Rechercher",
                          suffixIcon: const Icon(
                            Icons.search,
                            size: 17.5,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Erreur";
                          }
                          if (value.isEmpty) {
                            return "Numéro invalide";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    HomeActionButton(
                      icon: Icons.filter_list_sharp,
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Tendance",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.values[5]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "voir plus",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.values[5],
                            color: AppConstants().mediumPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 160,
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/vano_large.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 37,
                    child: BlocBuilder<CategoryCubit, CategoryState>(
                      builder: (context, state) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => CategoryItem(
                            isSelected: index == state.currentIndex,
                            label: state.categories[index],
                            onTap: () => BlocProvider.of<CategoryCubit>(context)
                                .setCategoryIndex(index),
                          ),
                          itemCount: state.categories.length,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: demoLists.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemBuilder: (context, index) => EventListWidget(
                      eventList: demoLists[index],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
