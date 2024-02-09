import 'dart:io';

import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/chat/domain/repositories/chat_repo.dart';

class ChatsUploadImageUseCase extends UseCase<Future<String>,File>
{
  final ChatRepo _chatRepo;

  ChatsUploadImageUseCase(this._chatRepo);
  @override
  Future<String> call([File? parameter])async {
    return await _chatRepo.uploadImage(parameter!);
  }

}