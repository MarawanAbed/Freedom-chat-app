import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/chat/data/models/message_model.dart';
import 'package:freedom_chat_app/features/chat/domain/repositories/chat_repo.dart';

class GetAllMessagesUseCase extends UseCase<Stream<List<MessageModel>>,String>
{
  final ChatRepo _chatRepo;

  GetAllMessagesUseCase(this._chatRepo);
  @override
  Stream<List<MessageModel>> call([String? parameter]) {
      return _chatRepo.getAllMessages(receiverId: parameter!);
  }

}