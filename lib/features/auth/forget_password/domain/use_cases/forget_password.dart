import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/auth/forget_password/domain/repositories/forget_repo.dart';

class ForgetPasswordUseCase extends UseCase<Future<void>, String> {
  ForgetPasswordUseCase(this.repository);

  final ForgetRepo repository;

  @override
  Future<void> call([String? parameter]) async {
    return await repository.forgetPassword(parameter!);
  }
}
