class OnboardingItem {
  final String imagePath;
  final String title;
  final String subtitle;
  OnboardingItem({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });
}

List<OnboardingItem> onboardingItems = [
  OnboardingItem(
    imagePath: "assets/images/onboarding_1.png",
    title: "Explorez les événements à venir",
    subtitle:
        "Apprenez-en davantage sur les évènements à venir et découvrez quels amis y participent.",
  ),
  OnboardingItem(
    imagePath: "assets/images/onboarding_2.png",
    title: "Ajoutez facilement un événement à votre calendrier",
    subtitle:
        "Ajoutez facilement des événements publics à votre calendrier personnel pour ne rien rater.",
  ),
  OnboardingItem(
    imagePath: "assets/images/onboarding_3.png",
    title: "Obtenez facilement vos billets d’accès aux évènements",
    subtitle:
        "Évitez les files d'attente et obtenez en ligne vos billets pour garantir votre accès à nos évènements",
  ),
];
