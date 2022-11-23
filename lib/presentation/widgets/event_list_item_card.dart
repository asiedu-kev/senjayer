import 'package:flutter/material.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/presentation/widgets/event_detail_item.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:senjayer/utils/util_functions.dart';
import 'package:sizer/sizer.dart';

class EventListItemCard extends StatelessWidget {
  final Event event;
  const EventListItemCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 1.5.h,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Container(
          height: 17.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage(event.imagePath),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 1.5.h,
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.bookmark_border,
                            size: 18.sp,
                            color: AppConstants().mediumPurple,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.title,
                              style: TextStyle(
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            EventDetailItem(
                              icon: Icons.event,
                              data: formatDate(event.date),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            EventDetailItem(
                              icon: Icons.local_activity,
                              data: "${event.price.toString()} FCFA",
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            EventDetailItem(
                              icon: Icons.location_on,
                              data: event.location,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
