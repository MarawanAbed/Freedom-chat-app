import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/auth/login/domain/repositories/login_repo.dart';
class TwitterSignInUseCase extends UseCase<Future<void>, NoParameter> {
  final LoginInRepo _authRepo;

  TwitterSignInUseCase(this._authRepo);

  @override
  Future<void> call([NoParameter? parameter])async {
    return await _authRepo.twitterSignIn();
  }
}
