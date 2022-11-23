import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
