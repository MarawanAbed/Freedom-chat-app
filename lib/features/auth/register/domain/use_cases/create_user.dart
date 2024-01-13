
import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/auth/register/domain/repositories/register_repo.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

class CreateUserUseCase extends UseCase<Future<void>, UserModel> {
  final RegisterRepo _registerRepo;

  CreateUserUseCase(this._registerRepo);

  @override
  Future<void> call([UserModel? parameter]) async {
    return await _registerRepo.createUser( parameter!);
  }
}
