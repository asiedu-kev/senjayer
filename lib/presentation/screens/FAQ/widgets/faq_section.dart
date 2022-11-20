import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class FAQSection extends StatefulWidget {
  const FAQSection({
    Key? key,
  }) : super(key: key);

  @override
  State<FAQSection> createState() => _FAQSectionState();
}

class _FAQSectionState extends State<FAQSection> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(bottom: 3.h,),
      duration: const Duration(
        milliseconds: 500,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: AppConstants().purple),
          borderRadius: BorderRadius.circular(15)),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: false,
          title: Text(
            'Comment créer un compte ?',
            style: TextStyle(
              fontSize: 11.5.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          onExpansionChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
          trailing: isExpanded
              ? const Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                )
              : const Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.black,
                ),
          children: [
            Divider(
              color: Colors.grey,
              indent: 4.w,
              endIndent: 4.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              child: Text(
                "Mobilize 20-25 community members and others with a tech profile for encryption courses on the Internet Society Learning platform",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 9.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
