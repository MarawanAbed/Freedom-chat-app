import 'package:freedom_chat_app/features/auth/forget_password/data/data_sources/remote_data_source.dart';
import 'package:freedom_chat_app/features/auth/forget_password/domain/repositories/forget_repo.dart';

class ForgetRepoImpl implements ForgetRepo
{
  final ForgetRemoteDataSource remoteDataSource;

  ForgetRepoImpl(this.remoteDataSource);
  @override
  Future<void> forgetPassword(String email)async {
    await remoteDataSource.forgetPassword(email);
  }

}