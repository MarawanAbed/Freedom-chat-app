import 'package:firebase_auth/firebase_auth.dart';
import 'package:freedom_chat_app/core/services/firebase_serivces.dart';
import 'package:freedom_chat_app/features/auth/login/data/models/sign_in_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> signIn(SignInModel signInModel);

  Future<void> googleSignIn();

  Future<void> gitHubSignIn(context);

  Future<void> twitterSignIn();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthService _auth;

  AuthRemoteDataSourceImpl(this._auth);

  @override
  Future<UserCredential> signIn(signInModel) async {
    return await _auth.signIn(
        email: signInModel.email, password: signInModel.password);
  }

  @override
  Future<void> googleSignIn() async {
    await _auth.handleGoogleSignIn();
  }

  @override
  Future<void> gitHubSignIn(context)async {
    await _auth.handleGitHubSignIn(context);
  }

  @override
  Future<void> twitterSignIn() async{
    await _auth.signInWithTwitter();
  }
}
