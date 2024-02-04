import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/domain/repositories/home_repo.dart';

class SearchUsersUseCase extends UseCase<Stream<List<UserModel>>,String>{
  final HomeRepo homeRepo;

  SearchUsersUseCase(this.homeRepo);
  @override
  Stream<List<UserModel>> call([String? parameter]){
    return homeRepo.searchUsers(name: parameter!);
  }

}