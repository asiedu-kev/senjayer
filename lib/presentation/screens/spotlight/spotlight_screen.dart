import 'package:flutter/material.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/presentation/screens/spotlight/widgets/spotlight_event_card.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:senjayer/utils/constants.dart';

class SpotlightScreen extends StatelessWidget {
  const SpotlightScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ArrowBackAppBar(title: "A la une").build(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ...List<Widget>.generate(
                  9,
                  (index) => SpotlightEventCard(
                    event: demoSpotlightEvents[index % 3],
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
