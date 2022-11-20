import 'package:flutter/material.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ArrowBackAppBar(title: "A PROPOS").build(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 18.w,
                  width: 18.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppConstants().purple),
                    image: const DecorationImage(
                      image: AssetImage("assets/icons/app_icon.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 4.h,
                  width: 35.w,
                  child: Image.asset("assets/images/Logo-SENJAYER.png"),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "La culture est l’affaire de tous, faisons vivre ensemble l’art de notre pays.",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Senjayer est une plateforme collaborative au service du spectacle. L’idée de départ, lancée en 2016 par Aubin Noutehou, était de mettre en lien artistes, promoteurs et spectateurs, de permettre à chacun de se connaître via un annuaire centralisé des profils mais aussi de faciliter la mise en oeuvre logistique des projets artistiques. Résolument communautaire s’enjayer vit de la dynamique apportée par chacun des acteurs de l’art : des artistes au spectateur. Il ne tient donc qu’à vous d’acceder à cette expérience nouvelle, sans intermédiaire et sécurisée.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 11.5.sp,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                RoundedButton(onPressed: () => Navigator.of(context).pushNamed("/contactUs"), label: "Contact commercial"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
