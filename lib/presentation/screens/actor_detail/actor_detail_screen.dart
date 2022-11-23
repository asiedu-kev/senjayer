import 'package:flutter/material.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:senjayer/presentation/widgets/event_list_item_card.dart';
import 'package:senjayer/utils/constants.dart';

import 'package:sizer/sizer.dart';

class ActorDetailScreen extends StatelessWidget {
  const ActorDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(title: "Acteur", actionFunction: () {})
          .build(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 33.w,
                    width: 33.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/togbe_profile.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Togbe YETON",
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 40.w,
                    height: 5.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppConstants().purple,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: AppConstants().purple),
                    ),
                    child: Text(
                      'Suivre',
                      style: TextStyle(
                        fontSize: 13.5.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.values[5],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "A propos",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quam neque pulvinar urna lacinia. Eleifend mauris, sit sed augue proin placerat morbi. Posuere dolor accumsan faucibus sed lobortis donec gravida a, volutpat. Convallis elementum quam interdum amet, tincidunt neque ultricies. Porta non condimentum dictum et, nullam lorem ut scelerisque risus. Turpis erat rhoncus diam non congue sed.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Evenements",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                ...demoEventListEvents
                    .map(
                      (event) => GestureDetector(
                        onTap: () =>
                            Navigator.of(context).pushNamed("/eventDetail"),
                        child: EventListItemCard(event: event),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
