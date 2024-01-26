import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/home/domain/repositories/home_repo.dart';

class HomeLogOutUseCase extends UseCase<Future<void>, NoParameter> {
  final HomeRepo homeRepo;

  HomeLogOutUseCase(this.homeRepo);

  @override
  Future<void> call([NoParameter? parameter]) async {
    return await homeRepo.logOut();
  }
}