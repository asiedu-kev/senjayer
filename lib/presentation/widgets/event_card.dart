import 'package:flutter/material.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/presentation/widgets/event_detail_item.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:senjayer/utils/util_functions.dart';

class EventDetailCard extends StatelessWidget {
  final Event event;
  final bool isLarge;
  const EventDetailCard({
    Key? key, required this.event,
    this.isLarge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 268,
          width: isLarge? double.infinity : 221,
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
                      image: AssetImage(event.imagePath),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Align(
                        alignment: Alignment.center,
                        child: Text(
                          event.title,

                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
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
                        data: event.price.toString(),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          EventDetailItem(
                            icon: Icons.location_on,
                            data: event.location,
                          ),
                          Icon(
                            Icons.bookmark_border,
                            size: 14,
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
    );
  }
}