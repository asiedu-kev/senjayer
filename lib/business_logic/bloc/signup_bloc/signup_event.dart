abstract class SignupEvent {
  const SignupEvent();
}

class VerificationHasError extends SignupEvent {
  final String error;

  VerificationHasError(this.error);
}

class AutoVerificationPerfomed extends SignupEvent {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String passwordConfirmation;

  AutoVerificationPerfomed(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.passwordConfirmation});
}

class VerificationCodeSend extends SignupEvent {
  final String verificationId;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String passwordConfirmation;

  VerificationCodeSend(
      {required this.verificationId,
      required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.passwordConfirmation});
}

class SignupButtonPressed extends SignupEvent {
  final String phone;
  final int? forceResendingToken;
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  SignupButtonPressed(
      {required this.phone,
      this.forceResendingToken,
      required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirmation});
}

class ProcessRegistration extends SignupEvent {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String passwordConfirmation;

  const ProcessRegistration({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  @override
  String toString() {
    return 'ProcessRegistration(name: $name, phone: $phone, email: $email, password: $password, passwordConfirmation: $passwordConfirmation)';
  }
}

class ValidationButtonPressed extends SignupEvent {
  final String code;
  final String verificationId;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String passwordConfirmation;

  ValidationButtonPressed(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.passwordConfirmation,
      required this.code,
      required this.verificationId});
}
