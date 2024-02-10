import 'package:freedom_chat_app/core/services/firebase_serivces.dart';

abstract class VerifyEmailRemoteDataSource {
  Future<void> verifyEmail();
  Future<bool> isEmailVerified();
  Future<void> resendVerificationEmail();
  Future<void> signOut();
}

class VerifyEmailRemoteDataSourceImpl implements VerifyEmailRemoteDataSource {
  final AuthService auth;

  VerifyEmailRemoteDataSourceImpl(this.auth);

  @override
  Future<void> verifyEmail() async {
    await auth.sendVerificationEmail();
  }

  @override
  Future<bool> isEmailVerified() async{
    return await auth.isEmailVerified();
  }

  @override
  Future<void> signOut() async{
    await auth.signOut();
  }

  @override
  Future<void> resendVerificationEmail()async {
    await auth.resendEmailVerification();
  }
}