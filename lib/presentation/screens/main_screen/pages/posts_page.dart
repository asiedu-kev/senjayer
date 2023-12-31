import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/cubit/post/post_cubit.dart';
import 'package:senjayer/business_logic/cubit/topic/topic_cubit.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/home_action_button.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/loading_post_card.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/no_post_widget.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/post_card.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/topic_item.dart';
import 'package:senjayer/presentation/widgets/shimmer.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Column(
          children: [
            Form(
              child: Row(
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
            ),
            SizedBox(
              height: 1.h,
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
                              onTap: () => BlocProvider.of<TopicCubit>(context)
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
              child: BlocBuilder<PostCubit, PostState>(
                builder: (context, state) {
                  if (state is PostFetched) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: List.generate(
                          state.posts.length,
                          (index) => PostCard(
                            post: state.posts[index],
                          ),
                        ),
                      ),
                    );
                  } else if (state is PostIsEmpty) {
                    return const NoPostWidget();
                  } else {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Shimmer(
                        linearGradient: AppConstants().shimmerGradient,
                        child: Column(
                          children: List.generate(
                            10,
                            (index) => const LoadingPostCard(),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
