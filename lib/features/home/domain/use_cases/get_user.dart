import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/domain/repositories/home_repo.dart';

class GetUserUseCase extends UseCase<Stream<UserModel>, String> {
  final HomeRepo homeRepo;

  GetUserUseCase(this.homeRepo);

  @override
  Stream<UserModel> call([String? parameter]) {
    return homeRepo.getUser(parameter!);
  }
}
