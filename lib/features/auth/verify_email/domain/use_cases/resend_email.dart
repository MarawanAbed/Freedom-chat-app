import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/auth/verify_email/domain/repositories/verify_email_repo.dart';

class ResendVerifyEmailUseCase extends UseCase<Future<void>,NoParameter>
{
  final VerifyEmailRepo verifyEmail;

  ResendVerifyEmailUseCase(this.verifyEmail);
  @override
  Future<void> call([NoParameter? parameter])async {
    return await verifyEmail.resendVerificationEmail();
  }

}