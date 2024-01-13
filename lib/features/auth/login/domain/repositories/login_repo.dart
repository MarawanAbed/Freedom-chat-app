import 'package:firebase_auth/firebase_auth.dart';
import 'package:freedom_chat_app/features/auth/login/data/models/sign_in_model.dart';

abstract class LoginInRepo {
  Future<UserCredential> signIn(SignInModel signInModel);

  Future<void> googleSignIn();

  Future<void> gitHubSignIn(context);

  Future<void> twitterSignIn();
}
