import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../data/enums/errors.dart';

Either<Errors, T> handleDioError<T>(DioError e) {
  log(e.response!.data['message']);
  if (e.message.toString().contains("SocketException")) {
    return left(Errors.socketError);
  } else {
    if (e.response!.data['message'] == "Password mismatch") {
      return left(Errors.passwordMisMatch);
    }
    if (e.response!.data['message'] == "The given data was invalid.") {
      if (e.response!.data['errors']['email'] != null) {
        if (e.response!.data['errors']['email'][0] ==
            "La valeur du champ email est déjà utilisée.") {
          return left(Errors.emailAlreadyInUse);
        }
      }
      if (e.response!.data['errors']['phone'] != null) {
        if (e.response!.data['errors']['phone'][0] ==
            "Le champ phone sélectionné est invalide.") {
          return left(Errors.incorrectphone);
        }
        if (e.response!.data['errors']['phone'][0] ==
            "La valeur du champ phone est déjà utilisée.") {
          return left(Errors.phoneAlreadyInUse);
        }
      }
    }
    /* if(e.response!.data.toString().contains("Le champ de confirmation password ne correspond pas")){
      return left(Errors.incompatiblePasswords);
    } */
  }
  return left(Errors.unexpected);
}

String handleFirebaseError(FirebaseException e) {
  if(e.message.toString().contains("The format of the phone number provided is incorrect")){
    return "Le format de votre numéro de téléphone est incorrect";
  } else if(e.message.toString().contains("A network error")){
    return "Erreur. Veuillez vérifiez votre connexion internet";
  } else if(e.message.toString().contains("The sms verification code used to create the phone auth credential is invalid")){
    return "Code de vérification incorrect. Veuillez réessayer.";
  } else{
    return "Erreur innatendue lors de la vérification de votre numéro de téléphone";
  }
}
