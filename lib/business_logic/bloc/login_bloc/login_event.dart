abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String phone;
  final String password;
  final bool rememberMe;

  const LoginButtonPressed({
    required this.phone,
    required this.password,
    required this.rememberMe,
  });

  @override
  String toString() =>
      'LoginButtonPressed { phone: $phone, password: $password }';
}
