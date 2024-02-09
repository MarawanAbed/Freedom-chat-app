import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/chat/domain/repositories/chat_repo.dart';

class GetUserIdUseCase extends UseCase<String?,NoParameter>{
  final ChatRepo _chatRepo;

  GetUserIdUseCase(this._chatRepo);
  @override
  String? call([NoParameter? parameter]) {
    return _chatRepo.getCurrentUserId();
  }

}