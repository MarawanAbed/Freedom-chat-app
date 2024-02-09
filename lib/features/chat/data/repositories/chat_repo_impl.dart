import 'dart:io';

import 'package:freedom_chat_app/features/chat/data/data_sources/remote_data_source.dart';
import 'package:freedom_chat_app/features/chat/data/models/message_model.dart';

import '../../domain/repositories/chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  final ChatRemoteDataSource _chatRemoteDataSource;

  ChatRepoImpl(this._chatRemoteDataSource);

  @override
  Future<void> addImageMessage({required MessageModel messageEntity}) async {
    await _chatRemoteDataSource.addImageMessage(messageEntity);
  }

  @override
  Future<void> addTextMessage({required MessageModel messageEntity}) async {
    await _chatRemoteDataSource.addTextMessage(messageEntity);
  }

  @override
  Stream<List<MessageModel>> getAllMessages({required String receiverId}) {
    return _chatRemoteDataSource.getAllMessages(receiverId: receiverId);
  }

  @override
  Future<String> uploadImage(File imageFile) async {
    return await _chatRemoteDataSource.uploadImage(imageFile);
  }

  @override
  String? getCurrentUserId() {
    return _chatRemoteDataSource.getCurrentUserId();
  }
}
