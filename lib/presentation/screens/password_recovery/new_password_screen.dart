import 'package:flutter/material.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmedPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool rememberMe;

  @override
  void initState() {
    rememberMe = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ArrowBackAppBar(title: "Mot de passe oublie").build(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                 SizedBox(
                  height: 2.h,
                ),
                 Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Créer un nouveau mot de passe",
                    style: TextStyle(
                      fontSize: 11.5.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Text(
                      "Mot de passe",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                 SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(hintText: "Mot de passe"),
                  validator: (value) {
                    if (value == null) {
                      return "Erreur";
                    }
                    if (value.isEmpty) {
                      return "Mot de passe invalide";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Text(
                      "Confirmer mot de passe",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  controller: _confirmedPasswordController,
                  decoration:
                      const InputDecoration(hintText: "Confirmer mot de passe"),
                  validator: (value) {
                    if (value == null) {
                      return "Erreur";
                    }
                    if (value.isEmpty) {
                      return "Mot de passe invalide";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 5.w,
                    ),
                    child: GestureDetector(
                      onTap: () => setState(() {
                        rememberMe = !rememberMe;
                      }),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          rememberMe
                              ? Icon(
                                  Icons.check_box_rounded,
                                  color: AppConstants().purple,
                                  size: 14.sp,
                                )
                              : Icon(
                                  Icons.check_box_outline_blank_rounded,
                                  color: AppConstants().purple,
                                  size: 14.sp,
                                ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Garder ma session active",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                RoundedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/successfulOperation");
                  },
                  label: 'Valider',
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
