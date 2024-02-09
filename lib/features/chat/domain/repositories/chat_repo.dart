import 'dart:io';

import '../../data/models/message_model.dart';

abstract class ChatRepo {
  Future<void> addTextMessage({required MessageModel messageEntity});

  Future<void> addImageMessage({required MessageModel messageEntity});

  Stream<List<MessageModel>> getAllMessages({required String receiverId});

  Future<String> uploadImage(File imageFile);

 String? getCurrentUserId();
}
