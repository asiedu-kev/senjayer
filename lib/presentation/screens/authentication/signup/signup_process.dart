import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/bloc/signup_bloc/signup.dart';
import 'package:senjayer/data/enums/otp_method.dart';
import 'package:senjayer/presentation/screens/authentication/signup/signup_screen.dart';
import 'package:senjayer/presentation/screens/otp/otp_screen.dart';

class SignupProcess extends StatelessWidget {
  const SignupProcess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupState>(
      listener: (context, state) {
        if(state is SignupCompleted){
          Navigator.of(context).pop();
        }
        if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is WrongOTP) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is SignUpOtpVerification || state is WrongOTP || state is VerificationLoading)  {
          return const OTPScreen(
            title: "Inscription",
            otpMethod: OTPMethod.sms,
          );
        } else {
          return const SingupScreen();
        }
      },
    );
  }
}
