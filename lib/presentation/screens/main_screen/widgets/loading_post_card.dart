import 'package:flutter/material.dart';
import 'package:senjayer/presentation/widgets/shimmer_loading.dart';
import 'package:sizer/sizer.dart';

class LoadingPostCard extends StatelessWidget {
  const LoadingPostCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: true,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed("/newsDetail"),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0.5.h,
          ),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              height: 9.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
