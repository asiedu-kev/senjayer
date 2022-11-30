import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:sizer/sizer.dart';

class TopEventsSlider extends StatefulWidget {
  final List<Event> topEvents;
  const TopEventsSlider({
    Key? key,
    required this.topEvents,
  }) : super(key: key);

  @override
  State<TopEventsSlider> createState() => _TopEventsSliderState();
}

class _TopEventsSliderState extends State<TopEventsSlider> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent1 = _scrollController.position.minScrollExtent;
      double maxScrollExtent1 = _scrollController.position.maxScrollExtent;
      //
      if (mounted) {
        if (_scrollController.hasClients) {
          animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1,
              25, _scrollController);
        }
      }
    });
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    if (scrollController.hasClients) {
      scrollController
          .animateTo(direction,
              duration: Duration(seconds: seconds), curve: Curves.linear)
          .then((value) {
        direction = direction == max ? min : max;
        animateToMaxMin(max, min, direction, seconds, scrollController);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      controller: _scrollController,
      itemCount: widget.topEvents.length,
      itemBuilder: (context, index) {
        return Container(
          height: 18.3.h,
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          width: 90.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20,
            ),
            image: DecorationImage(
              image: NetworkImage(
                widget.topEvents[index].imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
