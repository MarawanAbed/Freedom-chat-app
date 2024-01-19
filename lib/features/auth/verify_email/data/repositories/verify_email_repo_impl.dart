import 'package:freedom_chat_app/features/auth/verify_email/data/data_sources/remote_data_source.dart';

import '../../domain/repositories/verify_email_repo.dart';

class VerifyEmailRepoImpl implements VerifyEmailRepo {
  final VerifyEmailRemoteDataSource remoteDataSource;

  VerifyEmailRepoImpl(this.remoteDataSource);

  @override
  Future<void> verifyEmail() async {
    await remoteDataSource.verifyEmail();
  }

  @override
  Future<bool> isEmailVerified() async {
    return await remoteDataSource.isEmailVerified();
  }

  @override
  Future<void> signOut()async {
    return await remoteDataSource.signOut();
  }

  @override
  Future<void> resendVerificationEmail()async {
    return await remoteDataSource.resendVerificationEmail();
  }
}
