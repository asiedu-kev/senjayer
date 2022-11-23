import 'package:senjayer/data/models/user.dart';

abstract class SignupState {
  const SignupState();
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupFailure extends SignupState {
  final String error;

  const SignupFailure({required this.error});

  @override
  String toString() => 'SignupFailure { error: $error }';
}
