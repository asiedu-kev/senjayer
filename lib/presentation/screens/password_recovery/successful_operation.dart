import 'package:flutter/material.dart';
import 'package:senjayer/presentation/widgets/logo_box.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';

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
          const SizedBox(
            height: 70,
          ),
          Text(
            "Mot de passe réinitialisé",
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Bon retour !",
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 24,
                ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: RoundedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/main");
              },
              label: "Retour à l’accueil",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
