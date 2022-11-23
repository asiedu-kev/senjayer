import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class ImageIndexIndicator extends StatelessWidget {
  final int itemCount;
  final int selectedIndex;
  const ImageIndexIndicator({
    Key? key,
    required this.itemCount,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        2.h,
      ),
      child: SizedBox(
        height: 2.w,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => index == selectedIndex
              ? Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: .5.w,
                  ),
                  height: 2.w,
                  width: 10.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppConstants().purpleAccent,
                  ),
                )
              : Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: .5.w,
                  ),
                  height: 2.w,
                  width: 2.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
          itemCount: itemCount,
        ),
      ),
    );
  }
}
