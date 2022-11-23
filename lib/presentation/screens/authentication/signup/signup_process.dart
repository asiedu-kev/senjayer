import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/bloc/auth_bloc/auth.dart';
import 'package:senjayer/data/enums/otp_method.dart';
import 'package:senjayer/presentation/screens/authentication/signup/signup_screen.dart';
import 'package:senjayer/presentation/screens/otp/otp_screen.dart';

class SignupProcess extends StatelessWidget {
  const SignupProcess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          return  const OTPScreen(title: "Inscription", otpMethod: OTPMethod.sms,);
        }
        else {
        return  const SingupScreen(
          );
        }
      },
    );
  }
}
