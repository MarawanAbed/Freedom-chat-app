import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/auth/login/domain/repositories/login_repo.dart';
class GitHubSignInUseCase extends UseCase<Future<void>, BuildContext> {
  final LoginInRepo _authRepo;

  GitHubSignInUseCase(this._authRepo);

  @override
  Future<void> call([BuildContext? parameter])async {
    return await _authRepo.gitHubSignIn(parameter);
  }
}
