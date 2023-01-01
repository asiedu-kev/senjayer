import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/cubit/favorites/favorites_cubit.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class SpotlightEventCard extends StatelessWidget {
  final Event event;
  final bool? isFavorite;
  const SpotlightEventCard({
    Key? key,
    required this.event,
    this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        "/eventDetail",
        arguments: event,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 2.h,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Container(
            height: 23.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(event.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          event.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13.5.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<FavoritesCubit>(context)
                                .favoriteEvent(
                              event.id,
                            );
                          },
                          icon: Icon(
                            isFavorite != null
                                ? isFavorite!
                                    ? Icons.bookmark
                                    : Icons.bookmark_border
                                : Icons.bookmark_border,
                            size: 20.sp,
                            color: AppConstants().mediumPurple,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
