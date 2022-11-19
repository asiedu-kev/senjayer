import 'package:flutter/material.dart';
import 'package:senjayer/data/enums/otp_method.dart';
import 'package:senjayer/presentation/screens/password_recovery/widgets/recup_method_item.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:sizer/sizer.dart';

class PasswordRecupScreen extends StatelessWidget {
  const PasswordRecupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ArrowBackAppBar(title: "Mot de passe oublie").build(context),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          child: Column(
            children: [
               SizedBox(
                height: 2.h,
              ),
              Text(
                "Sélectionnez les coordonnées  que nous devons utiliser pour réinitialiser votre mot de passe.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 11.5.sp,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              RecupMethodItem(
                method: OTPMethod.sms,
                coordonate: "+229 94 ** 94 94",
                icon: Icons.message_rounded,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    "/otp",
                    arguments: {
                      'title': "Mot de passe oublié",
                      'otp_method': OTPMethod.sms,
                    },
                  );
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              RecupMethodItem(
                method: OTPMethod.mail,
                coordonate: "jy.**ouanvoedo@gmail.com",
                icon: Icons.mail_sharp,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    "/otp",
                    arguments: {
                      'title': "Mot de passe oublié",
                      'otp_method': OTPMethod.mail,
                    },
                  );
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
