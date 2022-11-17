import 'package:flutter/material.dart';
import 'package:senjayer/data/models/auth_method.dart';
import 'package:senjayer/presentation/screens/authentication/widgets/auth_method_button.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/utils/constants.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage("assets/icons/app_icon.png"),
                  ),
                  Text(
                    "Senjayer",
                    style: TextStyle(
                      fontSize: 24,
                      color: AppConstants().purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Connexion",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Mot de passe",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
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
                            const Text(
                              "Garder ma session active",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    label: "Se connecter",
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "ou poursuivre avec",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: authMethods
                        .map((authMethod) =>
                            AuthMethodButton(authMethod: authMethod))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Vous n'avez pas encore de compte ?",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed("/signup"),
                        child: Text(
                          "S'enregistrer",
                          style: TextStyle(
                            fontSize: 12,
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
