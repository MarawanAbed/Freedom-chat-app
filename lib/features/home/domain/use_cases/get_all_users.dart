import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/domain/repositories/home_repo.dart';

class GetAllUsersUseCase extends UseCase<Stream<List<UserModel>>, NoParameter> {
  final HomeRepo homeRepo;

  GetAllUsersUseCase(this.homeRepo);

  @override
  Stream<List<UserModel>> call([NoParameter? parameter]) {
    return homeRepo.getAllUsers();
  }
}
