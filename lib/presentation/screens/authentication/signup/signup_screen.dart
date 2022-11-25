import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/bloc/signup_bloc/signup.dart';
import 'package:senjayer/business_logic/cubit/password_cubit.dart';
import 'package:senjayer/data/models/auth_method.dart';
import 'package:senjayer/presentation/screens/authentication/widgets/auth_method_button.dart';
import 'package:senjayer/presentation/widgets/loading_button.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({Key? key}) : super(key: key);

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
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
                    "Inscription",
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
                      padding: EdgeInsets.only(left: 5.w),
                      child: Text(
                        "Nom",
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
                    controller: _nameController,
                    decoration:
                        const InputDecoration(hintText: "Nom d'utilisateur"),
                    validator: (value) {
                      if (value == null) {
                        return "Erreur";
                      }
                      if (value.isEmpty) {
                        return "Nom invalide";
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
                      padding: EdgeInsets.only(left: 5.w),
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: "Adresse mail"),
                    validator: (value) {
                      if (value == null) {
                        return "Erreur";
                      }
                      if (value.isEmpty) {
                        return "Adresse mail invalide";
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
                      padding: EdgeInsets.only(left: 5.w),
                      child: Text(
                        "Numéro de téléphone",
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
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration:
                        const InputDecoration(hintText: "Numéro de téléphone"),
                    validator: (value) {
                      if (value == null) {
                        return "Erreur";
                      }
                      if (value.isEmpty) {
                        return "Numéro invalide";
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
                      padding: const EdgeInsets.only(left: 20.0),
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
                      return null;
                    },
                    onChanged: (password) {
                      BlocProvider.of<PasswordCubit>(context)
                          .checkPassword(password);
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Votre mot de passe doit contenir",
                    style: TextStyle(
                      fontSize: 10.5.sp,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
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
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "Au minimum 6 caracteres",
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 9.sp,
                                    ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 1.h,
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
                            size: 15.sp,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "Contenir un caractere ASCI et un chiffre",
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 9.sp,
                                    ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  BlocBuilder<SignupBloc, SignupState>(
                    builder: (context, state) {
                      if (state is SignupLoading) {
                        return const LoadingButton();
                      }
                      return RoundedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<SignupBloc>(context).add(
                                SignupButtonPressed(
                                  phone: _phoneNumberController.text.trim(),
                                  name: _nameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text,
                                  passwordConfirmation:
                                      _passwordController.text,
                                ),
                              );
                              /* SignupButtonPressed(
                                  name: _nameController.text,
                                  phone: _phoneNumberController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  passwordConfirmation:
                                      _passwordController.text,
                                ),
                              ); */
                              /* Navigator.of(context).pushNamed(
                                "/otp",
                                arguments: {
                                  'title': "Inscription",
                                  'otp_method': OTPMethod.sms,
                                },
                              ); */
                            }
                          },
                          label: "S'inscrire");
                    },
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
