import 'package:freedom_chat_app/core/services/firebase_serivces.dart';

abstract class ForgetRemoteDataSource {
  Future<void> forgetPassword(String email);
}

class ForgetRemoteDataSourceImpl implements ForgetRemoteDataSource {
  final AuthService auth;
  ForgetRemoteDataSourceImpl({required this.auth});

  @override
  Future<void> forgetPassword(String email) async {
    await auth.forgetPassword(email);
  }
}
