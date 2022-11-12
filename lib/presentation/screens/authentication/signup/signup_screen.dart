import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/cubit/password_cubit.dart';
import 'package:senjayer/data/models/auth_method.dart';
import 'package:senjayer/presentation/screens/authentication/widgets/auth_method_button.dart';
import 'package:senjayer/utils/constants.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({Key? key}) : super(key: key);

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

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
          physics: const BouncingScrollPhysics(),
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
                  /* 
                  const SizedBox(
                    height: 10,
                  ), */
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
                    "Inscription",
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
                      log("valdating");
                      return null;
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
                        "Numéro de téléphone",
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
                    controller: _phoneNumberController,
                    decoration:
                        const InputDecoration(hintText: "Numéro de téléphone"),
                    validator: (value) {
                      if (value == null) {
                        return "Erreur";
                      }
                      if (value.isEmpty) {
                        return "Numéro invalide";
                      }
                      log("valdating");
                      return null;
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
                      return null;
                    },
                    onChanged: (password){
                      BlocProvider.of<PasswordCubit>(context).checkPassword(password);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Votre mot de passe doit contenir",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<PasswordCubit, PasswordState>(
                    builder: (context, state) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            state.isLongEnought
                                ? Icons.check_circle_sharp
                                : Icons.cancel_rounded,
                            color: state.isLongEnought
                                ? Theme.of(context).primaryColor
                                : Colors.red,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Au minimum 6 caracteres",
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 12,
                                    ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<PasswordCubit, PasswordState>(
                    builder: (context, state) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            state.containsASCIIAndNumber
                                ? Icons.check_circle_sharp
                                : Icons.cancel_rounded,
                            color: state.containsASCIIAndNumber
                                ? Theme.of(context).primaryColor
                                : Colors.red,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Contenir un caractere ASCI et un chiffre",
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 12,
                                    ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushNamed("/otp");
                      }
                    },
                    elevation: 0,
                    height: 48,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        40,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    color: AppConstants().purple,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "S'inscrire",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.values[5],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
