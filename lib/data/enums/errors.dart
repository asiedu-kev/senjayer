enum Errors{
  socketError,
 incompatiblePasswords,
 passwordMisMatch,
 incorrectphone,
 phoneAlreadyInUse,
 emailAlreadyInUse,
 nameDoNotContainEnoughCaracters,
 unexpected;

 @override
  String toString(){
    switch (this) {
      case Errors.socketError:
        return "Erreur réseau, Veuillez verifier votre connexion internet";

      case Errors.incompatiblePasswords:
        return "Les mots de passe sont incompatibles";

      case Errors.passwordMisMatch:
        return "Mot de pass incorrect";
      
      case Errors.incorrectphone:
        return "Numéro invalide ou Aucun compte n'existe avec ce numéro de téléphone";
      
      case Errors.phoneAlreadyInUse:
        return "Un compte avec ce numéro de téléphone existe déjà";

      case Errors.emailAlreadyInUse:
        return "Un compte avec cette adresse mail existe déjà";
      
      case Errors.nameDoNotContainEnoughCaracters:
        return "Le champ 'Nom' doit contenir au moins 4 caractères";

      default:
      return "Erreur inattendue";
    }
  }
}