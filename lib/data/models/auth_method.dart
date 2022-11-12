class AuthMethod {
  final String name;
  final String imagePath;
  AuthMethod({
    required this.name,
    required this.imagePath,
  });
}

List<AuthMethod> authMethods = [
  AuthMethod(name: "Facebook", imagePath: "assets/icons/facebook_circle.png"),
  AuthMethod(name: "Twitter", imagePath: "assets/icons/twitter_circle.png"),
  AuthMethod(name: "Google", imagePath: "assets/icons/google-logo.png"),
];