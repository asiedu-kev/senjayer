import 'package:flutter/material.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/presentation/widgets/shimmer_loading.dart';
import 'package:sizer/sizer.dart';

class ActorLoadingItem extends StatelessWidget {
  const ActorLoadingItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: true,
      child: SizedBox(
        height: 30.h,
        width: 30.w,
        child: Column(
          children: [
            Container(
              height: 27.w,
              width: 27.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 1.5.h,
              width: 15.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),

            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: 27.w,
              child: RoundedButton(
                onPressed: () {},
                color: Colors.black,
                label: "Consulter",
                height: 5.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
