import 'package:flutter/material.dart';
import 'package:senjayer/data/enums/otp_method.dart';
import 'package:senjayer/presentation/screens/authentication/widgets/pin_entry.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:sizer/sizer.dart';

class OTPScreen extends StatelessWidget {
  final String title;
  final OTPMethod otpMethod;
  const OTPScreen({
    Key? key,
    required this.title,
    this.otpMethod = OTPMethod.sms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(title: title).build(context),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Column(
          children: [
            const Spacer(),
            Text(
              "Un code a été envoyé ${otpMethod == OTPMethod.sms? "au +229 94 94 ** 94" : "à l'adresse mail : jy.**ouanvoedo@gmail.com"}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.5.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            const PinEntryTextField(),
            SizedBox(
              height: 5.h,
            ),
            RichText(
              text:  TextSpan(
                  text: "Renvoyer le code dans ",
                  style: TextStyle(
                    fontSize: 11.5.sp,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: '01:00',
                      style: TextStyle(
                        fontSize: 11.5.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
            const Spacer(),
            RoundedButton(onPressed: () {
              if(otpMethod == OTPMethod.mail){
                Navigator.of(context).pushNamed("/newPassword");
              }
            }, label: "Vérifier"),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
