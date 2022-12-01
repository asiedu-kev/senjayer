import 'package:flutter/material.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/presentation/widgets/event_detail_item.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:senjayer/utils/util_functions.dart';
import 'package:sizer/sizer.dart';

class EventDetailCard extends StatelessWidget {
  final Event event;
  final bool isLarge;
  const EventDetailCard({
    Key? key,
    required this.event,
    this.isLarge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        "/eventDetail",
        arguments: event,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 2.w),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 30.h,
            width: isLarge ? double.infinity : 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
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
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.name,
                          style: TextStyle(
                            fontSize: 13.5.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 0.7.h,
                        ),
                        EventDetailItem(
                          icon: Icons.event,
                          data: formatDate(event.startDate),
                        ),
                        SizedBox(
                          height: 0.7.h,
                        ),
                        EventDetailItem(
                          icon: Icons.local_activity,
                          data: event.getMinTicketPrice().toString(),
                        ),
                        SizedBox(
                          height: 0.7.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            EventDetailItem(
                              icon: Icons.location_on,
                              data: event.eventAddress,
                            ),
                            Icon(
                              Icons.bookmark_border,
                              size: 11.sp,
                              color: AppConstants().mediumPurple,
                            ),
                          ],
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
