import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/home/domain/repositories/home_repo.dart';

class UpdateUserUseCase extends UseCase<Future<void>,Map<String,dynamic>>
{
  final HomeRepo homeRepo;

  UpdateUserUseCase(this.homeRepo);
  @override
  Future<void> call([Map<String, dynamic>? parameter]) async{
    return await homeRepo.updateUser(parameter!);
  }

}