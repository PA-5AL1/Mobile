class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = 'Une erreur inconnue est survenue.']);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Le mot passe n\'est pas assez fort.');
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure('L\'email est invalide.');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure('L\'email est déjà utilisé.');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'L\'opération n\'est pas autorisée.');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'L\'utilisateur est désactivé.');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
