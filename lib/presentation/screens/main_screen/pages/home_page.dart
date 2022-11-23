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
import 'package:sizer/sizer.dart';

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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              child: Column(
                children: [
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
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                BlocProvider.of<SearchCubit>(context)
                                    .search(value);
                              }
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
                ],
              ),
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return state.isSearching
                    ? Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                SizedBox(height: 2.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Résultats de recherche",
                                      style: TextStyle(
                                          fontSize: 13.5.sp,
                                          fontWeight: FontWeight.values[5]),
                                    ),
                                    Text(
                                      '${state.searchResult.length.toString()} trouvé${state.searchResult.length > 1 ? "(s)" : ""}',
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.values[5],
                                        color: AppConstants().mediumPurple,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.5.h,
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
                              SizedBox(height: 2.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.w),
                                    child: Text(
                                      "A la une",
                                      style: TextStyle(
                                          fontSize: 13.5.sp,
                                          fontWeight: FontWeight.values[5]),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.w),
                                    child: TextButton(
                                      onPressed: () => Navigator.of(context)
                                          .pushNamed("/spotlight"),
                                      child: Text(
                                        "voir plus",
                                        style: TextStyle(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.values[5],
                                          color: AppConstants().mediumPurple,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),
                              Container(
                                height: 18.3.h,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5.w),
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
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: 4.5.h,
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
                              SizedBox(
                                height: 2.h,
                              ),
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: demoLists.length,
                                separatorBuilder: (context, index) =>
                                    SizedBox(
                                  height: 1.h,
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
