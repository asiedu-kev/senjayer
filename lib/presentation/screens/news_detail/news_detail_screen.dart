import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/Canal_olympia.png",
                    fit: BoxFit.fill,
                  ),
                )),
                const Expanded(child: SizedBox()),
              ],
            ),
            Column(
              children: [
                const Expanded(child: SizedBox()),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 2.h,
                  ),
                  height: 55.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Musique",
                        style: TextStyle(
                          fontSize: 8.5.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Togbe Yeton de retour en concert ?",
                              style: TextStyle(
                                fontSize: 19.5.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 10.sp,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 11.w,
                            width: 11.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/togbe.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Magali DEGILA",
                                style: TextStyle(
                                  fontSize: 11.5.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "23 Aout 2020",
                                style: TextStyle(
                                  fontSize: 6.sp,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Expanded(
                        child: Text(
                          "Yeezus est le sixième album studio de Kanye West, sorti en 2013. Il est distribué par Def Jam. Après une pause dans sa carrière musicale solo, West a travaillé sur cet opus à travers un développement communautaire l'impliquant lui-même ainsi que d'autres musiciens et producteurs qui contribuent collectivement à sa musique. Les sessions d'enregistrement se sont principalement tenues dans un endroit inconnu à Paris, entre 2010 et 2013. La production est assurée par Kanye West et plusieurs autres producteurs, tels que Jeff Bhasker, RZA, No I.D. et Mike Dean, entre autres. L'album est disponible sur Internet dès le 14 juin 2013, soit 4 jours avant sa sortie officielle.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: AppConstants().grey,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                      Divider(
                        color: AppConstants().grey,
                        thickness: 0.5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.share,
                            size: 15.sp,
                          ),
                          const Spacer(),
                          Text(
                            '94',
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Icon(
                            Icons.favorite_border,
                            size: 15.sp,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            '25',
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Icon(
                            Icons.message,
                            size: 15.sp,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
