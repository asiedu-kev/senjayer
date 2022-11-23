import 'package:flutter/material.dart';
import 'package:senjayer/presentation/screens/edit_profile/widgets/edit_drop_down_field.dart';
import 'package:senjayer/presentation/screens/edit_profile/widgets/edit_textfield.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ArrowBackAppBar(title: "Editer le profil").build(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 30.w,
                  width: 30.w,
                  child: Stack(
                    children: [
                      Container(
                        height: 30.w,
                        width: 30.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image:
                                AssetImage("assets/images/profile_picture.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 1.h,
                        right: 0,
                        child: Container(
                          height: 7.w,
                          width: 7.w,
                          decoration: BoxDecoration(
                            color: AppConstants().lightPurple,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 10.sp,
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
                const Divider(),
                const EditTextField(
                  title: "Nom et prénoms ",
                  hintText: "Petit Dèkpè",
                  isNecessary: false,
                  suffixIconPath: "assets/icons/user_icon.png",
                  color: Colors.grey,
                ),
                const EditTextField(
                    title: "Numéro de téléphone",
                    hintText: "229 97 001 001",
                    isNecessary: true,
                    suffixIconPath: "assets/icons/phone.png"),
                const EditTextField(
                    title: "Adresse email ",
                    hintText: "petitdekpe@gmail.com",
                    isNecessary: true,
                    suffixIconPath: "assets/icons/envelop.png"),
                const EditDropDownField(
                  title: "Genre ",
                  items: [
                    "Masculin",
                    "Féminin",
                    "Autre",
                  ],
                ),
                const EditDropDownField(
                  title: "Localisation ",
                  items: [
                    "Cotonou, Bénin",
                  ],
                ),
                RoundedButton(onPressed: () {}, label: "Enrégistrer"),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
