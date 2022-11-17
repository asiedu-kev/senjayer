import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/cubit/category_cubit.dart';
import 'package:senjayer/business_logic/cubit/search_cubit.dart';
import 'package:senjayer/data/models/event_list.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/category_item.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/event_list_widget.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/home_action_button.dart';
import 'package:senjayer/presentation/screens/main_screen/widgets/no_result_widget.dart';
import 'package:senjayer/presentation/widgets/event_list_item_card.dart';
import 'package:senjayer/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _focusNode = FocusNode();

  final TextEditingController _researchController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_focusNode.hasFocus) {
          log("TTT");
          _focusNode.unfocus();
          BlocProvider.of<SearchCubit>(context).toogleIsSearching(false);
          return false;
        } else {
          return false;
        }
      },
      child: SafeArea(
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
                        onTap: () =>
                            Navigator.of(context).pushNamed("/notifications"),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      HomeActionButton(
                        icon: Icons.bookmark,
                        onTap: () =>
                            Navigator.of(context).pushNamed("/favorites"),
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
                  Form(
                    key: _formKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            focusNode: _focusNode,
                            controller: _researchController,
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
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                BlocProvider.of<SearchCubit>(context)
                                    .search(value);
                              }
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
                  ),
                ],
              ),
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return state.isSearching
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Résultats de recherche",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.values[5]),
                                    ),
                                    Text(
                                      '${state.searchResult.length.toString()} trouvé${state.searchResult.length > 1 ? "(s)" : ""}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.values[5],
                                        color: AppConstants().mediumPurple,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                state.searchResult.isNotEmpty
                                    ? Column(
                                        children: state.searchResult
                                            .map(
                                              (event) => GestureDetector(
                                                onTap: () => Navigator.of(
                                                        context)
                                                    .pushNamed("/eventDetail"),
                                                child: EventListItemCard(
                                                    event: event),
                                              ),
                                            )
                                            .toList(),
                                      )
                                    : const NoResultWidget(),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    child: Text(
                                      "A la une",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.values[5]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: TextButton(
                                      onPressed: () => Navigator.of(context)
                                          .pushNamed("/spotlight"),
                                      child: Text(
                                        "voir plus",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.values[5],
                                          color: AppConstants().mediumPurple,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Container(
                                height: 160,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/vano_large.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 37,
                                child:
                                    BlocBuilder<CategoryCubit, CategoryState>(
                                  builder: (context, state) {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          CategoryItem(
                                        isSelected: index == state.currentIndex,
                                        label: state.categories[index],
                                        onTap: () =>
                                            BlocProvider.of<CategoryCubit>(
                                                    context)
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
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 15,
                                ),
                                itemBuilder: (context, index) =>
                                    EventListWidget(
                                  eventList: demoLists[index],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
