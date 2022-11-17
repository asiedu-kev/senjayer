import 'package:bloc/bloc.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit()
      : super(
          PasswordState(
            containsASCIIAndNumber: false,
            isLongEnought: false,
          ),
        );

  void checkPassword(String password) {
    if (password.isEmpty) {
      emit(
        PasswordState(
          containsASCIIAndNumber: true,
          isLongEnought: true,
        ),
      );
    } else {
      late bool containsASCIIAndNumber;
      late bool isLongEnought;
      if (password.contains(RegExp(r'[0-9]')) &&
          password.contains(RegExp(r"[!#$%&'*+-/=?^_`{|}~]"))) {
        containsASCIIAndNumber = true;
      } else {
        containsASCIIAndNumber = false;
      }
      if (password.length > 5) {
        isLongEnought = true;
      } else {
        isLongEnought = false;
      }
      emit(
        PasswordState(
          containsASCIIAndNumber: containsASCIIAndNumber,
          isLongEnought: isLongEnought,
        ),
      );
    }
  }
}
