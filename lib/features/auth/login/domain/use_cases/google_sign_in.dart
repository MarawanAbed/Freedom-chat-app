import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/auth/login/domain/repositories/login_repo.dart';

class GoogleSignInUseCase extends UseCase<Future<void>, NoParameter> {
  final LoginInRepo _authRepo;

  GoogleSignInUseCase(this._authRepo);

  @override
  Future<void> call([NoParameter? parameter])async {
    return await _authRepo.googleSignIn();
  }
}
