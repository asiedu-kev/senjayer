import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/cubit/payment_method_cubit.dart';
import 'package:senjayer/presentation/screens/choose_payment_method/widgets/pament_method_item.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class ChoosePaymentMethodScreen extends StatelessWidget {
  final int totalAmount;
  const ChoosePaymentMethodScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(
        title: "Acheter votre ticket",
        leadingFunction: () {},
      ).build(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 19.5.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$totalAmount F FCA",
                      style: TextStyle(
                        fontSize: 19.5.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 5.w,
                    ),
                    child: Text(
                      'Moyen de paiement',
                      style: TextStyle(
                        fontSize: 11.5.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return PaymentMethodItem(
                          paymentMethod: state.methods[index],
                          isSelected: index == state.selectedMethodIndex,
                          onPressed: () =>
                              BlocProvider.of<PaymentMethodCubit>(context)
                                  .choosePaymentMethod(index),
                        );
                      },
                      itemCount: state.methods.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                    );
                  },
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 5.w,
                    ),
                    child: Text(
                      'Code Promo',
                      style: TextStyle(
                        fontSize: 11.5.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 4.3.h,
                      width: 65.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(
                            10,
                          ),
                          bottomLeft: Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      child: TextField(
                        cursorColor: AppConstants().purple,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                        ),
                      ),
                    ),
                    Container(
                      height: 4.3.h,
                      width: 23.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppConstants().purple,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(
                            10,
                          ),
                          bottomRight: Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      child: Text(
                        "Ajouter",
                        style:
                            TextStyle(fontSize: 14.5.sp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                RoundedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 7.w,
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
                                borderRadius: BorderRadius.circular(25),
                                color: AppConstants().lightPurple,
                              ),
                              child: Icon(
                                Icons.check_box,
                                color: AppConstants().purple,
                                size: 19.w,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                              ),
                              child: Text(
                                "Paiement réussi",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: RoundedButton(
                                  onPressed: () {}, label: "Voir le ticket"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  label: "Payer",
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
