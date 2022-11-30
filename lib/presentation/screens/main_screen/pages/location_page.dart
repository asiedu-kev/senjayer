import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/cubit/room_category/room_category_cubit.dart';
import 'package:senjayer/business_logic/cubit/topic/topic_cubit.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/home_action_button.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/place_card.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/room_card.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/room_category_item.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/topic_item.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Form(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: AppConstants().purple,
                      decoration: InputDecoration(
                        fillColor: AppConstants().lightPurple,
                        filled: true,
                        hintText: "Rechercher",
                        suffixIcon: Icon(
                          Icons.search,
                          size: 14.sp,
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
                   SizedBox(
                    width: 3.w,
                  ),
                  HomeActionButton(
                    icon: Icons.filter_list_sharp,
                    onTap: () {},
                  ),
                   SizedBox(
                    width: 3.w,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "voir plus",
                      style: TextStyle(
                        fontSize: 8.5.sp,
                        fontWeight: FontWeight.values[5],
                        color: AppConstants().mediumPurple,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Salles en vogue",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 4.5.h,
                child: BlocBuilder<RoomCategoryCubit, RoomCategoryState>(
                  builder: (context, state) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => RoomCategoryItem(
                        isSelected: index == state.currentIndex,
                        label: state.categories[index],
                        onTap: () => BlocProvider.of<RoomCategoryCubit>(context)
                            .setCategoryIndex(index),
                      ),
                      itemCount: state.categories.length,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 19.2.h,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const RoomCard();
                    }),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 3.5.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppConstants().grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: BlocBuilder<TopicCubit, TopicState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...state.topics
                            .map(
                              (topic) => TopicItem(
                                onTap: () =>
                                    BlocProvider.of<TopicCubit>(context)
                                        .setTopicIndex(
                                  state.topics.indexOf(topic),
                                ),
                                topic: topic,
                                isSelected: state.currentIndex ==
                                    state.topics.indexOf(topic),
                              ),
                            )
                            .toList(),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(0),
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.3,
                crossAxisSpacing: 2.w,
                mainAxisSpacing: 0,
              ),
              itemCount: 10,
              itemBuilder: (ctx, index) {
                return const PlaceCard();
              },
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}

