import 'package:flutter/material.dart';
import 'package:senjayer/presentation/screens/authentication/widgets/pin_entry.dart';
import 'package:senjayer/utils/constants.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_outlined,
            color: AppConstants().purple,
          ),
        ),
        title: Text(
          "Inscription",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.values[5],
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const Spacer(),
            const Text(
              "Un code a été envoyé au +229 94 94 ** 94",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            PinEntryTextField(),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 35,
            ),
            RichText(
              text: const TextSpan(
                  text: "Renvoyer le code dans ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: '01:00',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
            const Spacer(),
            MaterialButton(
              onPressed: () {},
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
                      "Vérifier",
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
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
