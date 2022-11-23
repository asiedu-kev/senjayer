import 'package:flutter/material.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/data/models/event_list.dart';
import 'package:senjayer/presentation/widgets/event_list_item_card.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:sizer/sizer.dart';

class EventListScreen extends StatelessWidget {
  final EventList eventList;
  const EventListScreen({
    Key? key,
    required this.eventList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(title: eventList.listTitle).build(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ...List<Widget>.generate(
                  10,
                  (index) => EventListItemCard(
                    event: demoEventListEvents[index % 4],
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
