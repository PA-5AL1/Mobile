class LoginWithEmailAndPasswordFailure {
  final String message;

  const LoginWithEmailAndPasswordFailure(
      [this.message = 'Une erreur inconnue est survenue.']);

  factory LoginWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'user-not-found':
        return const LoginWithEmailAndPasswordFailure(
            'Aucun utilisateur trouvé avec cette adresse email.');
      case 'wrong-password':
        return const LoginWithEmailAndPasswordFailure(
            'Mot de passe incorrect.');
      case 'invalid-email':
        return const LoginWithEmailAndPasswordFailure(
            'Adresse email invalide.');
      case 'user-disabled':
        return const LoginWithEmailAndPasswordFailure(
            'Votre compte a été désactivé.');
      case 'too-many-requests':
        return const LoginWithEmailAndPasswordFailure(
            'Trop de tentatives de connexion. Veuillez réessayer plus tard.');
      case 'network-request-failed':
        return const LoginWithEmailAndPasswordFailure(
            'Erreur de connexion. Veuillez vérifier votre connexion internet.');
      default:
        return const LoginWithEmailAndPasswordFailure();
    }
  }
}
