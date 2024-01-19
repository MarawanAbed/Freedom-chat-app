import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/auth/verify_email/domain/repositories/verify_email_repo.dart';

class CheckVerifyEmailUseCase extends UseCase<Future<bool>, NoParameter> {
  final VerifyEmailRepo verifyEmailRepo;

  CheckVerifyEmailUseCase(this.verifyEmailRepo);

  @override
  Future<bool> call([NoParameter? parameter])async {
    return await verifyEmailRepo.isEmailVerified();
  }
}
