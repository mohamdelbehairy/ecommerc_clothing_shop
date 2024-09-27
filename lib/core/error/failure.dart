class Failure {
  final String message;

  Failure({required this.message});
}

class FirebaseFailure extends Failure {
  FirebaseFailure({required super.message});

  factory FirebaseFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-credential':
        return FirebaseFailure(
            message:
                'There was a problem logging in. Please check your email and password');
      case 'user-disabled':
        return FirebaseFailure(message: 'Account disabled');
      case 'user-not-found':
        return FirebaseFailure(message: 'Account not found');
      case 'wrong-password':
        return FirebaseFailure(message: 'Wrong password');
      case 'email-already-in-use':
        return FirebaseFailure(message: 'Email already in use');
      case 'operation-not-allowed':
        return FirebaseFailure(message: 'Operation not allowed');
      case 'weak-password':
        return FirebaseFailure(message: 'Weak password');

      default:
        return FirebaseFailure(message: 'Operation failed, please try again');
    }
  }
}
