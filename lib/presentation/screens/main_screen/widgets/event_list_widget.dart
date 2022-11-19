import 'package:flutter/material.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/data/models/event_list.dart';
import 'package:senjayer/presentation/widgets/event_card.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class EventListWidget extends StatelessWidget {
  final EventList eventList;
  const EventListWidget({Key? key, required this.eventList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                eventList.listTitle,
                style:
                    TextStyle(fontSize: 13.5.sp, fontWeight: FontWeight.values[5]),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: TextButton(
                onPressed: () => Navigator.of(context).pushNamed(
                  "/eventList",
                  arguments: eventList,
                ),
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
        SizedBox(
          height: 32.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: eventList.events.length,
            itemBuilder: (context, index) => EventDetailCard(
              event: eventList.events[index],
            ),
          ),
        ),
      ],
    );
  }
}
