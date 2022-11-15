import 'package:flutter/material.dart';
import 'package:senjayer/data/enums/otp_method.dart';
import 'package:senjayer/presentation/screens/authentication/widgets/pin_entry.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/utils/constants.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_outlined,
            color: AppConstants().purple,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.values[5],
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const Spacer(),
            Text(
              "Un code a été envoyé ${otpMethod == OTPMethod.sms? "au +229 94 94 ** 94" : "à l'adresse mail : jy.**ouanvoedo@gmail.com"}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            const PinEntryTextField(),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 35,
            ),
            RichText(
              text: const TextSpan(
                  text: "Renvoyer le code dans ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: '01:00',
                      style: TextStyle(
                        fontSize: 16,
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
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
