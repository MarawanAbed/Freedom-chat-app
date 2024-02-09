import 'dart:io';

import 'package:freedom_chat_app/core/services/firebase_serivces.dart';
import 'package:freedom_chat_app/features/chat/data/models/message_model.dart';

abstract class ChatRemoteDataSource {
  Future<void> addTextMessage(MessageModel messageEntity);

  Future<void> addImageMessage(MessageModel messageEntity);

  Stream<List<MessageModel>> getAllMessages({required String receiverId});

  Future<String> uploadImage(File imageFile);

 String? getCurrentUserId();
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final DatabaseService _databaseService;

  final StorageService _storageService;
  final AuthService _authService;

  ChatRemoteDataSourceImpl(this._databaseService, this._storageService, this._authService);

  @override
  Future<void> addImageMessage(MessageModel messageEntity) async {
    await _databaseService.addImageMessage(messageEntity: messageEntity);
  }

  @override
  Future<void> addTextMessage(MessageModel messageEntity) async {
    await _databaseService.addTextMessage(messageEntity: messageEntity);
  }

  @override
  Stream<List<MessageModel>> getAllMessages({required String receiverId}) {
    return _databaseService.getAllMessage(receiverId: receiverId);
  }

  @override
  Future<String> uploadImage(File imageFile)async {
    return await _storageService.uploadImage(imageFile);
  }

  @override
  String? getCurrentUserId() {
    return  _authService.getCurrentUserId();
  }
}
