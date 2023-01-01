import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<OtpButtonPressed>(
      (event, emit) async {
        final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
        await firebaseAuth.verifyPhoneNumber(
            phoneNumber: "event",
            timeout: const Duration(seconds: 60),
            forceResendingToken: event.forceResendingToken,
            verificationCompleted: (PhoneAuthCredential credential) async {
              log('verificationCompleted');
            },
            verificationFailed: (FirebaseAuthException e) async {
              log('verificationFailed');
              log(e.message.toString());
            },
            codeSent: (String verificationId, int? resendToken) async {
              log('codeSent');
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId,
                smsCode: event.code,
              );
              await firebaseAuth.signInWithCredential(credential);
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              log('codeAutoRetrievalTimeout');
            }); /* 
    return 'response'; */
      },
    );
  }
}
