import 'package:flutter/material.dart';
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
            child: Column(
              children: topEvents
                  .map(
                    (topEvent) => SpotlightEventCard(
                      event: topEvent,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
