class Actor {
  final String name;
  final String profilePath;
  final bool isOrganizer;
  Actor({
    required this.name,
    required this.profilePath,
    required this.isOrganizer,
  });
}

List<Actor> demoActors = [
  Actor(name: "Togbè Yéton", isOrganizer: false, profilePath: "assets/images/togbe_profile.png"),
  Actor(name: "Vano Baby", isOrganizer: false, profilePath: "assets/images/vano_profile.png"),
  Actor(name: "Groupe Empire", isOrganizer: true, profilePath: "assets/images/empire.png"),
  Actor(name: "Beyonce & Jay Z", isOrganizer: false, profilePath: "assets/images/amazon.png"),
];