import 'package:flutter/material.dart';
import 'package:senjayer/presentation/widgets/loading_event_detail_card.dart';
import 'package:senjayer/presentation/widgets/shimmer.dart';
import 'package:senjayer/presentation/widgets/shimmer_loading.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class EventListLoadingWidget extends StatelessWidget {
  const EventListLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      linearGradient: AppConstants().shimmerGradient,
      child: ShimmerLoading(
        isLoading: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  height: 2.h,
                  width: 15.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5.w),
                  height: 2.h,
                  width: 15.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => const LoadingEventDetailCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
