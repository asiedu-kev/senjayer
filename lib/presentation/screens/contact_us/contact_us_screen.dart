import 'package:flutter/material.dart';
import 'package:senjayer/presentation/screens/contact_us/widgets/contact_text_field.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:sizer/sizer.dart';

class COntactUsScreen extends StatelessWidget {
  const COntactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ArrowBackAppBar(title: "Nous contacter").build(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 0),
          child: Column(
            children: [
              const ContactTextField(title: "Nom complet"),
              const ContactTextField(
                title: "Email",
                suffixIcon: Icons.mail,
              ),
              const ContactTextField(
                title: "Message ",
                maxLength: 250,
                minLines: 5,
              ),
              const Spacer(),
              RoundedButton(onPressed: () {}, label: "Envoyer le message"),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
