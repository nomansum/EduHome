class SignUpWithEmailAndPasswordFailure {
  final String message;
  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown Error Occurred!"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please Enter a Stronger Password.');

      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            "Email not valid or badly formatted");

      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            "An account already exists for that email");

      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Operation not allowed please contact support.');

      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'This user hase been disabled. Please contact support for help.');

      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
