import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/cubit/favorites/favorites_cubit.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/presentation/screens/favorites/widgets/no_favorite_widget.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:senjayer/presentation/widgets/event_card.dart';
import 'package:senjayer/presentation/widgets/loading_event_detail_card.dart';
import 'package:senjayer/presentation/widgets/shimmer.dart';
import 'package:senjayer/presentation/widgets/shimmer_loading.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  /* 
  late bool hasFavorite; */
  @override
  void initState() {
    /* 
    hasFavorite = false; */
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(const Duration(seconds: 5)).then(
      (value) => setState(() {
        /* 
        hasFavorite = true; */
      }),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(
        title: "Favoris",
        actionFunction: () {},
      ).build(context),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesIsEmpty) {
            return const NoFavoriteWidget();
          } else if (state is FavoritesFetched) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List<Widget>.generate(
                    9,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: EventDetailCard(
                        event: demoFavoriteEvents[index % 3],
                        isLarge: true,
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List<Widget>.generate(
                      9,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: Shimmer(
                  linearGradient: AppConstants().shimmerGradient,
                  child: const ShimmerLoading(
                          isLoading: true,
                          child: LoadingEventDetailCard(
                            isLarge: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
