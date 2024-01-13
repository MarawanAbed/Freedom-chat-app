import 'package:firebase_auth/firebase_auth.dart';
import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/auth/login/data/models/sign_in_model.dart';
import 'package:freedom_chat_app/features/auth/login/domain/repositories/login_repo.dart';

class SignInUseCase extends UseCase<Future<UserCredential>, SignInModel> {
  final LoginInRepo _authRepo;

  SignInUseCase(this._authRepo);

  @override
  Future<UserCredential> call([SignInModel? parameter]) async {
    return await _authRepo.signIn(parameter!);
  }
}
