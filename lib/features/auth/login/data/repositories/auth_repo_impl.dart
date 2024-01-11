import 'package:firebase_auth/firebase_auth.dart';
import 'package:freedom_chat_app/features/auth/login/data/models/sign_in_model.dart';
import 'package:freedom_chat_app/features/auth/login/domain/repositories/auth_repo.dart';

import '../data_sources/remote_data_source.dart';


class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<void> googleSignIn() async{
    return await _authRemoteDataSource.googleSignIn();
  }

  @override
  Future<UserCredential> signIn(SignInModel signInModel)async {
    return await _authRemoteDataSource.signIn(signInModel);
  }

  @override
  Future<void> gitHubSignIn(context)async {
    return await _authRemoteDataSource.gitHubSignIn(context);
  }

  @override
  Future<void> twitterSignIn() async{
    return await _authRemoteDataSource.twitterSignIn();
  }

}
