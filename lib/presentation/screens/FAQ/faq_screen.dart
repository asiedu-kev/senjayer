import 'package:flutter/material.dart';
import 'package:senjayer/presentation/screens/FAQ/widgets/faq_section.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:sizer/sizer.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ArrowBackAppBar(title: "FAQ").build(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: List.generate(10, (index) => const FAQSection()),
            ),
          ),
        ),
      ),
    );
  }
}