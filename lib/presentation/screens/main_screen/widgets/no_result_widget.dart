import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40.w,
            width: 40.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppConstants().lightPurple,
            ),
            child: Icon(
              Icons.sentiment_dissatisfied,
              color: AppConstants().purple,
              size: 60.sp,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,),
            child: Text(
              "Aucun résultat trouvé",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 17.5.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/5,),
            child: Text(
              "Veuillez essayer un autre mot-clé",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 10.sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
