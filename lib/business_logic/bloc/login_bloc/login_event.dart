abstract class LoginEvent {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String phone;
  final String password;

  const LoginButtonPressed({
    required this.phone,
    required this.password,
  });

  @override
  String toString() =>
      'LoginButtonPressed { phone: $phone, password: $password }';
}
