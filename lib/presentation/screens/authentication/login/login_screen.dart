import 'package:flutter/material.dart';
import 'package:senjayer/data/models/auth_method.dart';
import 'package:senjayer/presentation/screens/authentication/widgets/auth_method_button.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool rememberMe;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    rememberMe = false;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage("assets/icons/app_icon.png"),
                  ),
                  Text(
                    "Senjayer",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppConstants().purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                 Text(
                    "Connexion",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: Text(
                        "Email",
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
                    controller: _emailController,
                    decoration: const InputDecoration(hintText: "Adresse mail"),
                    validator: (value) {
                      if (value == null) {
                        return "Erreur";
                      }
                      if (value.isEmpty) {
                        return "Adresse mail invalide";
                      }
                      if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value.trim())) {
                        return null;
                      } else {
                        return "Adresse mail invalide";
                      }
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
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: const InputDecoration(hintText: "Mot de passe"),
                    validator: (value) {
                      if (value == null) {
                        return "Erreur";
                      }
                      if (value.isEmpty) {
                        return "Adresse mail ou mot de passe erroné";
                      }
                      if (value.length < 6) {
                        return "Adresse mail ou mot de passe erroné";
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
                                    size: 18,
                                  )
                                : Icon(
                                    Icons.check_box_outline_blank_rounded,
                                    color: AppConstants().purple,
                                    size: 18,
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
                  SizedBox(
                    height: 2.h,
                  ),
                  RoundedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    label: "Se connecter",
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                   Text(
                    "ou poursuivre avec",
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: authMethods
                        .map((authMethod) =>
                            AuthMethodButton(authMethod: authMethod))
                        .toList(),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Vous n'avez pas encore de compte ?",
                        style: TextStyle(
                          fontSize: 9.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed("/signup"),
                        child: Text(
                          "S'enregistrer",
                          style: TextStyle(
                            fontSize: 9.sp,
                            color: AppConstants().purple,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
