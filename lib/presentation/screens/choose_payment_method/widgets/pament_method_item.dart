import 'package:flutter/material.dart';
import 'package:senjayer/data/models/payment_method.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class PaymentMethodItem extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final bool isSelected;
  final VoidCallback onPressed;
  const PaymentMethodItem({
    Key? key,
    required this.paymentMethod,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 2.h,
        ),
        height: 7.5.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 5.w,
              ),
              height: 9.w,
              width: 9.w,
              child: Image.asset(
                paymentMethod.imagePath,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              paymentMethod.label,
              style: TextStyle(
                fontSize: 13.5.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Container(
              margin: EdgeInsets.only(
                right: 5.w,
              ),
              padding: EdgeInsets.all(0.8.w),
              height: 4.w,
              width: 4.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppConstants().purple),
                shape: BoxShape.circle,
              ),
              child: isSelected
                  ? Container(
                      height: 3.5.w,
                      width: 3.5.w,
                      decoration: BoxDecoration(
                        color: AppConstants().purple,
                        shape: BoxShape.circle,
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
