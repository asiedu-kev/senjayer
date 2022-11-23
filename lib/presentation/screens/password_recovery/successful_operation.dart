import 'package:flutter/material.dart';
import 'package:senjayer/presentation/widgets/logo_box.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:sizer/sizer.dart';

class SuccessfulOperationScreen extends StatelessWidget {
  const SuccessfulOperationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Row(
            children: const [
              Spacer(),
              LogoBox(),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            "Mot de passe réinitialisé",
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 18.5.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "Bon retour !",
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 18.5.sp,
                ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
            ),
            child: RoundedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/main");
              },
              label: "Retour à l’accueil",
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
