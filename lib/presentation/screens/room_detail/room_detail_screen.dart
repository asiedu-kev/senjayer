import 'package:flutter/material.dart';
import 'package:senjayer/presentation/screens/room_detail/widgets/image_index_indicator.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class HallDetailScreen extends StatelessWidget {
  const HallDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/salle_canal.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const ImageIndexIndicator(
                  itemCount: 6,
                  selectedIndex: 1,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 10.w,
                        width: 10.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.visibility_outlined,
                          size: 15.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 2.w,),
                      Expanded(
                        child: Text(
                          "Canal Olympia - Wologuede",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(2.w),
                        height: 10.w,
                        width: 10.w,
                        decoration: BoxDecoration(
                          color: AppConstants().lightPurple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/icons/location.png"),
                      ),
                      SizedBox(width: 2.w,),
                      Expanded(
                        child: Text(
                          "Ciné Vog - Wologuede, mairie de Cotonou",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
