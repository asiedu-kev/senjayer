import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/cubit/favorites/favorites_cubit.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/presentation/screens/spotlight/widgets/spotlight_event_card.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:sizer/sizer.dart';

class SpotlightScreen extends StatelessWidget {
  final List<Event> topEvents;
  const SpotlightScreen({
    Key? key,
    required this.topEvents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ArrowBackAppBar(title: "A la une").build(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
              builder: (context, state) {
                if (state is FavoritesFetched) {
                  return Column(
                    children: topEvents
                        .map(
                          (topEvent) => SpotlightEventCard(
                            event: topEvent,
                            isFavorite: BlocProvider.of<FavoritesCubit>(context)
                                .isFavorite(topEvent.id),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Column(
                    children: topEvents
                        .map(
                          (topEvent) => SpotlightEventCard(
                            event: topEvent,
                          ),
                        )
                        .toList(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
