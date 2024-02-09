import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/chat/data/models/message_model.dart';
import 'package:freedom_chat_app/features/chat/domain/repositories/chat_repo.dart';

class AddTextMessageUseCase extends UseCase<Future<void>, MessageModel> {
  final ChatRepo _chatRepo;

  AddTextMessageUseCase(this._chatRepo);

  @override
  Future<void> call([MessageModel? parameter]) {
    return _chatRepo.addTextMessage(messageEntity: parameter!);
  }
}
