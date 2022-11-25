import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/bloc/auth_bloc/auth.dart';
import 'package:senjayer/data/models/user.dart';
import 'package:senjayer/data/repositories/auth_repository.dart';
import 'package:senjayer/utils/handle_errors.dart';
import 'signup.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepository;
  final AuthenticationBloc authenticationBloc;

  SignupBloc({
    required this.authRepository,
    required this.authenticationBloc,
  }) : super(SignupInitial()) {
    on<SignupButtonPressed>(
      (event, emit) async {
        log("SignupButtonPressed");
        emit(SignupLoading());
        final fb.FirebaseAuth firebaseAuth = fb.FirebaseAuth.instance;
        firebaseAuth.verifyPhoneNumber(
          phoneNumber: "+229${event.phone}",
          timeout: const Duration(seconds: 60),
          forceResendingToken: event.forceResendingToken,
          verificationCompleted: (fb.PhoneAuthCredential credential) async {
            log('verificationCompleted');
            add(AutoVerificationPerfomed(
                name: event.name,
                phone: event.phone,
                email: event.email,
                password: event.password,
                passwordConfirmation: event.passwordConfirmation));
          },
          verificationFailed: (fb.FirebaseAuthException e) async {
            log('verificationFailed');
            log(e.message.toString());
            add(VerificationHasError(handleFirebaseError(e)));
          },
          codeSent: (String verificationId, int? resendToken) async {
            log('codeSent');
            add(VerificationCodeSend(
                verificationId: verificationId,
                name: event.name,
                phone: event.phone,
                email: event.email,
                password: event.password,
                passwordConfirmation: event.passwordConfirmation));
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            log('codeAutoRetrievalTimeout');

            add(VerificationHasError("Délai d'attente dépassé"));
          },
        );
      },
    );

    on<AutoVerificationPerfomed>(
      (event, emit) {
        log("AutoVerificationPerfomed");
        add(ProcessRegistration(
            name: event.name,
            phone: event.phone,
            email: event.email,
            password: event.password,
            passwordConfirmation: event.passwordConfirmation));
      },
    );

    on<VerificationCodeSend>(
      (event, emit) {
        log("VerificationCodeSend");
        emit(SignUpOtpVerification(
            verificationId: event.verificationId,
            email: event.email,
            name: event.name,
            password: event.password,
            passwordConfirmation: event.passwordConfirmation,
            phone: event.phone));
      },
    );

    on<VerificationHasError>(
      (event, emit) {
        log("VerificationHasError");
        emit(SignupFailure(error: event.error));
      },
    );

    on<ProcessRegistration>((event, emit) async {
      log("ProcessRegistration");
      emit(
        SignupLoading(),
      );
      try {
        final loginEither = await authRepository.register(
          event.name,
          event.phone,
          event.email,
          event.password,
          event.passwordConfirmation,
        );
        loginEither.fold((error) {
          throw error;
        }, (responseData) {
          authenticationBloc.add(
            LoggedIn(
              token: responseData["access_token"],
              user: User.fromMap(
                responseData["user"],
              ),
            ),
          );
          emit(SignupCompleted());
        });
      } on DioError catch (error) {
        emit(
          SignupFailure(
            error: error.toString(),
          ),
        );
      } catch (error) {
        emit(
          SignupFailure(
            error: error.toString(),
          ),
        );
      }
    });
    on<ValidationButtonPressed>(
      (event, emit) async {
        log("ValidationButtonPressed");
        final fb.FirebaseAuth firebaseAuth = fb.FirebaseAuth.instance;
        try {
          fb.PhoneAuthCredential credential = fb.PhoneAuthProvider.credential(
            verificationId: event.verificationId,
            smsCode: event.code,
          );
          await firebaseAuth.signInWithCredential(credential);
          add(ProcessRegistration(
              name: event.name,
              phone: event.phone,
              email: event.email,
              password: event.password,
              passwordConfirmation: event.passwordConfirmation));
        } on fb.FirebaseAuthException catch (e) {
          log(e.message.toString());
          emit(WrongOTP(error: handleFirebaseError(e)));
          emit(SignUpOtpVerification(
            verificationId: event.verificationId,
            email: event.email,
            name: event.name,
            password: event.password,
            passwordConfirmation: event.passwordConfirmation,
            phone: event.phone));
        } catch (e) {
          emit(
            const SignupFailure(
              error:
                  "Une erreur s'est produite lors de la vérification du code",
            ),
          );
        }
      },
    );
  }
}
