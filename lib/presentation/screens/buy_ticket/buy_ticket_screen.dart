import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/cubit/ticket_cubit.dart';
import 'package:senjayer/data/models/pricing.dart';
import 'package:senjayer/presentation/screens/buy_ticket/widgets/ticket_information_card.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';

class BuyTicketScreen extends StatelessWidget {
  const BuyTicketScreen({Key? key}) : super(key: key);

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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 5.w,
                    ),
                    child: Text(
                      'Choisir le ticket',
                      style: TextStyle(
                        fontSize: 11.5.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  height: 6.5.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppConstants().lightPurple,
                  ),
                  child: BlocBuilder<TicketCubit, TicketState>(
                    builder: (context, state) {
                      return DropdownButton<Pricing>(
                        underline: const SizedBox(),
                        dropdownColor: AppConstants().lightPurple,
                        value: state.pricing,
                        isExpanded: true,
                        items: demoPricing.map((Pricing pricing) {
                          return DropdownMenuItem<Pricing>(
                            value: pricing,
                            child: Text(
                              "${pricing.label} (${pricing.price} F CFA)",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (pricing) {
                          if (pricing != null) {
                            BlocProvider.of<TicketCubit>(context)
                                .setPricing(pricing);
                          }
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 5.w,
                    ),
                    child: Text(
                      'Choisir le nombre',
                      style: TextStyle(
                        fontSize: 11.5.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                  height: 8.6.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => BlocProvider.of<TicketCubit>(context)
                            .decrementTickets(),
                        child: Container(
                          height: 10.w,
                          width: 10.w,
                          decoration: BoxDecoration(
                            color: AppConstants().lightPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.remove,
                            size: 18.sp,
                            color: AppConstants().purple,
                          ),
                        ),
                      ),
                      BlocBuilder<TicketCubit, TicketState>(
                        builder: (context, state) {
                          return Text(
                            state.itemCount.toString(),
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () => BlocProvider.of<TicketCubit>(context)
                            .incrementTickets(),
                        child: Container(
                          height: 10.w,
                          width: 10.w,
                          decoration: BoxDecoration(
                            color: AppConstants().lightPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 18.sp,
                            color: AppConstants().purple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 5.w,
                    ),
                    child: Text(
                      'Vos informations',
                      style: TextStyle(
                        fontSize: 11.5.sp,
                      ),
                    ),
                  ),
                ),
                BlocBuilder<TicketCubit, TicketState>(
                  builder: (context, state) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          const TicketInformationCard(),
                      itemCount: state.itemCount,
                    );
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                RoundedButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                        "/choosePaymentMethod",
                        arguments: BlocProvider.of<TicketCubit>(context)
                            .getTotalAmount()),
                    label: "Continuer"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
