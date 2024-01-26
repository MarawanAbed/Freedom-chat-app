import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/domain/repositories/home_repo.dart';

class UpdateEmailAndPasswordUseCase extends UseCase<Future<void>, UserModel> {
  final HomeRepo homeRepo;

  UpdateEmailAndPasswordUseCase(this.homeRepo);

  @override
  Future<void> call([UserModel? parameter]) async {
    return await homeRepo.updateEmailAndPassword(
        email: parameter!.email!, password: parameter.password!);
  }
}
