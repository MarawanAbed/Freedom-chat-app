import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrors {
  static String getFirebaseAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'user-disabled':
        return 'The user corresponding to the given email has been disabled.';
      case 'too-many-requests':
        return 'We have blocked all requests from this device due to unusual activity. Try again later.';
      case 'operation-not-allowed':
        return 'Email & Password accounts are not enabled.';
      case 'network-request-failed':
        return 'Network error, please check your internet connection.';
      case 'Failed to send email verification':
        return 'Failed to send email verification';
      case 'Failed to send password reset email':
        return 'Failed to send password reset email';
      case 'Weak password':
        return 'Password should be at least 6 characters';
      case 'Failed to sign out':
        return 'Failed to sign out';
      default:
        return 'An error occurred';
    }
  }
}