import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/home/domain/repositories/home_repo.dart';

class UserUidUseCase extends UseCase< String?, NoParameter> {
  final HomeRepo homeRepo;

  UserUidUseCase(this.homeRepo);

  @override
  String? call([NoParameter? parameter]) {
    return homeRepo.getCurrentUserId();
  }


}