import 'package:count_down_time/count_down_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/presentation/widgets/loading_button.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

import 'package:senjayer/business_logic/bloc/signup_bloc/signup.dart';
import 'package:senjayer/data/enums/otp_method.dart';
import 'package:senjayer/presentation/screens/authentication/widgets/pin_entry.dart';
import 'package:senjayer/presentation/widgets/arrow_back_appbar.dart';
import 'package:senjayer/presentation/widgets/rounded_button.dart';

class OTPScreen extends StatefulWidget {
  final String title;
  final OTPMethod otpMethod;
  const OTPScreen({
    Key? key,
    required this.title,
    this.otpMethod = OTPMethod.sms,
  }) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late bool canResendCode;
  late bool cantResendCode;
  late bool hasAlreadyResent;
  String code = '';
  void saveCode(String pin) {
    setState(() {
      code = pin;
    });
  }

  @override
  void initState() {
    canResendCode = false;
    cantResendCode = false;
    hasAlreadyResent = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(title: widget.title).build(context),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Column(
          children: [
            const Spacer(),
            Text(
              "Un code a été envoyé ${widget.otpMethod == OTPMethod.sms ? "au +229 94 94 ** 94" : "à l'adresse mail : jy.**ouanvoedo@gmail.com"}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11.5.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            PinEntryTextField(
              onTypingCompleted: saveCode,
            ),
            SizedBox(
              height: 5.h,
            ),
            hasAlreadyResent
                ? const SizedBox()
                : canResendCode
                    ? TextButton(
                        onPressed: () {
                          final SignupState state =
                              BlocProvider.of<SignupBloc>(context).state;
                          if (state is SignUpOtpVerification) {
                            if (state.forceResendingToken != null) {
                              BlocProvider.of<SignupBloc>(context).add(
                                SignupButtonPressed(
                                    phone: state.phone,
                                    name: state.name,
                                    email: state.email,
                                    password: state.password,
                                    passwordConfirmation:
                                        state.passwordConfirmation,
                                    forceResendingToken:
                                        state.forceResendingToken),
                              );
                              setState(() {
                                hasAlreadyResent = true;
                              });
                            } else {
                              setState(() {
                                cantResendCode = true;
                              });
                            }
                          }
                        },
                        child: Text(
                          'Renvoyer le code',
                          style: TextStyle(
                            fontSize: 11.5.sp,
                            color: AppConstants().purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : cantResendCode
                        ? Text(
                            'Impossible de renvoyer le code.',
                            style: TextStyle(
                              fontSize: 11.5.sp,
                              color: AppConstants().red,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Renvoyer le code dans ",
                                style: TextStyle(
                                  fontSize: 11.5.sp,
                                  color: Colors.black,
                                ),
                              ),
                              CountDownTime.minutes (
                                onTimeOut: () {
                                  setState(() {
                                    canResendCode = true;
                                  });
                                },
                                timeStartInMinutes: 1,
                                textStyle: TextStyle(
                                  fontSize: 11.5.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
            const Spacer(),
            
            BlocBuilder<SignupBloc, SignupState>(
                    builder: (context, state) {
                      if (state is VerificationLoading) {
                        return const LoadingButton();
                      }
                      return RoundedButton(
                onPressed: () {
                  if (code.isNotEmpty) {
                    final signupVerification =
                        (BlocProvider.of<SignupBloc>(context).state
                            as SignUpOtpVerification);
                    BlocProvider.of<SignupBloc>(context).add(
                        ValidationButtonPressed(
                            name: signupVerification.name,
                            phone: signupVerification.phone,
                            email: signupVerification.email,
                            password: signupVerification.password,
                            passwordConfirmation:
                                signupVerification.passwordConfirmation,
                            code: code,
                            verificationId: signupVerification.verificationId));
                  }
                },
                label: "Vérifier");
                    },
                  ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
