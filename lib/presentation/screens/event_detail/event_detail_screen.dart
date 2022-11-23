import 'package:flutter/material.dart';
import 'package:senjayer/data/models/pricing.dart';
import 'package:senjayer/presentation/screens/event_detail/widgets/pricing_item.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 0,
        ),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
                child: Image.asset(
                  "assets/images/vano_description.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 1.h,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppConstants().purple,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Concert",
                  style: TextStyle(
                    color: AppConstants().purple,
                    fontSize: 7.sp,
                    fontWeight: FontWeight.values[4],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Concert Test App",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.5.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 9.w,
                                width: 9.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppConstants().lightPurple,
                                ),
                                child: Icon(
                                  Icons.event_available,
                                  size: 15.sp,
                                  color: AppConstants().purple,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "10 Avril 2022",
                                    style: TextStyle(
                                      fontSize: 11.5.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "16:00 - 20:00",
                                    style: TextStyle(
                                      fontSize: 11.5.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                           SizedBox(
                            height: 1.h,
                          ),
                          GestureDetector(
                            onTap: () => showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 6.w,
                                  ),
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 40.w,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: AppConstants().lightPurple,
                                        ),
                                        child: Icon(
                                          Icons.event_available,
                                          color: AppConstants().purple,
                                          size: 50.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                        ),
                                        child: Text(
                                          "Ajouté avec succès au calendrier",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: 18.5.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.w,
                                vertical: 1.h,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppConstants().purple,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Ajouter au calendrier",
                                style: TextStyle(
                                  color: AppConstants().purple,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 9.w,
                                width: 9.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppConstants().lightPurple,
                                ),
                                child: Icon(
                                  Icons.location_on,
                                  size: 15.sp,
                                  color: AppConstants().purple,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Stade ABCDEFG",
                                    style: TextStyle(
                                      fontSize: 11.5.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Cotonou, BENIN",
                                    style: TextStyle(
                                      fontSize: 11.5.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.w,
                              vertical: 1.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppConstants().purple,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Voir sur la carte",
                              style: TextStyle(
                                color: AppConstants().purple,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.5.sp,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quam neque pulvinar urna lacinia. Eleifend mauris, sit sed augue proin placerat morbi. Posuere dolor accumsan faucibus sed lobortis donec gravida a, volutpat. Convallis elementum quam interdum amet, tincidunt neque ultricies. Porta non condimentum dictum et, nullam lorem ut scelerisque risus. Turpis erat rhoncus diam non congue sed.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 9.sp,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed("/organizerDetail"),
                child: Row(
                  children: [
                    Container(
                      height: 14.w,
                      width: 14.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppConstants().purple,
                        ),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage("assets/images/empire.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Groupe Empire",
                          style: TextStyle(
                            fontSize: 11.5.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Organisateur",
                          style: TextStyle(
                            fontSize: 11.5.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Pricing",
                style: TextStyle(
                  fontSize: 11.5.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              ...demoPricing
                  .map(
                    (pricing) => PricingItem(
                      pricing: pricing,
                    ),
                  )
                  .toList(),
              SizedBox(
                height: 2.h,
              ),
              RoundedButton(
                onPressed: () {},
                label: 'Poser une question',
                color: AppConstants().lightPurple,
              ),
              SizedBox(
                height: 13.h,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -1),
              blurRadius: 4,
              color: Colors.grey.withOpacity(0.5),
            )
          ],
        ),
        height: 10.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 11.6.w,
              width: 11.6.w,
              padding: EdgeInsets.all(1.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppConstants().lightPurple,
              ),
              child: Icon(
                Icons.share,
                size: 20.sp,
                color: AppConstants().purple,
              ),
            ),
            Container(
              height: 11.6.w,
              width: 11.6.w,
              padding: EdgeInsets.all(1.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppConstants().lightPurple,
              ),
              child: Icon(
                Icons.turned_in_not,
                size: 20.sp,
                color: AppConstants().purple,
              ),
            ),
            SizedBox(
              width: 50.w,
              child: RoundedButton(
                label: "Acheter Ticket",
                onPressed: () => Navigator.of(context).pushNamed("/buyTicket"),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
