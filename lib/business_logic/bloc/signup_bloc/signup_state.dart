abstract class SignupState {
  const SignupState();
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupCompleted extends SignupState{}

class SignUpOtpVerification extends SignupState {
  final String verificationId;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String passwordConfirmation;

  SignUpOtpVerification({
    required this.verificationId,
    required this.email,
    required this.name,
    required this.password,
    required this.passwordConfirmation,
    required this.phone,
  });
}

class WrongOTP extends SignupState {
  final String error;

  const WrongOTP({required this.error});
}

class SignupFailure extends SignupState {
  final String error;

  const SignupFailure({required this.error});

  @override
  String toString() => 'SignupFailure { error: $error }';
}
