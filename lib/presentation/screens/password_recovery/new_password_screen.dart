import 'package:flutter/material.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';
import 'package:senjayer/utils/constants.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Créer un nouveau mot de passe",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
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
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Confirmer mot de passe",
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
                const SizedBox(
                  height: 25,
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
                const Spacer(),
                RoundedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/successfulOperation");
                  },
                  label: 'Valider',
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
