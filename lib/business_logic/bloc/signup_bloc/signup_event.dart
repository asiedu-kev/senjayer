abstract class SignupEvent {
  const SignupEvent();
}

class SignupButtonPressed extends SignupEvent {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String passwordConfirmation;

  const SignupButtonPressed({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  @override
  String toString() {
    return 'SignupButtonPressed(name: $name, phone: $phone, email: $email, password: $password, passwordConfirmation: $passwordConfirmation)';
  }
}
