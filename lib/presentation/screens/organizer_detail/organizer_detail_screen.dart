import 'package:flutter/material.dart';
import 'package:senjayer/data/models/event.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:senjayer/presentation/widgets/event_list_item_card.dart';
import 'package:senjayer/utils/constants.dart';

import 'package:sizer/sizer.dart';

class OrganizerDetailScreen extends StatelessWidget {
  const OrganizerDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(title: "Organisateur", leadingFunction: () {})
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
                        image: AssetImage("assets/images/empire.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Groupe Empire",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 2.w,
                      ),
                      height: 5.w,
                      width: 5.w,
                      child: Image.asset("assets/icons/certified.png"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 40.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: AppConstants().purple),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_add_rounded,
                                color: AppConstants().purple,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                'Suivre',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppConstants().purple,
                                  fontWeight: FontWeight.values[5],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                    ),
                    SizedBox(
                      width: 40.w,
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        height: 5.h,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            40,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 1.h,
                        ),
                        color: AppConstants().purple,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Message',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.values[5],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            SizedBox(
                              height: 3.w,
                              width: 3.w,
                              child: Image.asset("assets/icons/envelop.png"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
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
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quam neque pulvinar urna lacinia. Eleifend mauris, sit sed augue proin placerat morbi. ",
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
