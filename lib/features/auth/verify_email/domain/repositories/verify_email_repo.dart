abstract class VerifyEmailRepo {
  Future<void> verifyEmail();
  Future<bool> isEmailVerified();
  Future<void> resendVerificationEmail();
  Future<void> signOut();
}
