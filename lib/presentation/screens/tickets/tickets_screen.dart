import 'package:flutter/material.dart';
import 'package:senjayer/presentation/screens/tickets/widgets/ticket_item.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:sizer/sizer.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ArrowBackAppBar(title: "Tickets achetés").build(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: GridView.builder(
              padding: const EdgeInsets.all(0),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              itemCount: 10,
              itemBuilder: (ctx, index) {
                return const TicketItem();
              },
            ),
        ),
      ),
    );
  }
}
