
import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/auth/register/data/models/register_model.dart';
import 'package:freedom_chat_app/features/auth/register/domain/repositories/register_repo.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

class RegisterUseCase extends UseCase<Future<void>, UserModel> {
  final RegisterRepo _registerRepo;

  RegisterUseCase(this._registerRepo);

  @override
  Future<void> call([UserModel? parameter]) async {
    return await _registerRepo.register( parameter!);
  }
}
