part of 'password_cubit.dart';

class PasswordState {
  final bool isLongEnought;
  final bool containsASCIIAndNumber;
  PasswordState({
    required this.isLongEnought,
    required this.containsASCIIAndNumber,
  });
}
