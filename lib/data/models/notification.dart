class Notification {
  final String title;
  final String content;
  Notification({
    required this.title,
    required this.content,
  });
}
//TODO: Add date attribut and create a cubit tp sort notifiactions per date

List<Notification> notifiactions1 = [
  Notification(title: "Annulation", content: "Pour des raisons de santé, le concert de l’artiste Rasta Souris programmé pour Samedi est annulé. "),
  Notification(title: "Remise 10%", content: 'Profitez d’une remise de 10% sur toutes nos ventes de billets de concerts jusqu’à minuit. '),
];

List<Notification> notifiactions2 = [
  Notification(title: "Paiement accepté", content: "Pour des raisons de santé, le concert de l’artiste Rasta Souris programmé pour Samedi est annulé. "),
  Notification(title: "Commande annulée", content: 'Profitez d’une remise de 10% sur toutes nos ventes de billets de concerts jusqu’à minuit. '),
];