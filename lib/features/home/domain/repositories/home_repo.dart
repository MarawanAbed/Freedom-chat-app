import 'dart:io';

import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

abstract class HomeRepo {
  Stream<List<UserModel>> getAllUsers();

  Stream<UserModel> getUser(String uid);

  Future<void> logOut();

  String? getCurrentUserId();

  Future<String> uploadImage(File imageFile);

  Future<void> updateEmailAndPassword(
      {required String email, required String password});

  Future<void> updateUser(Map<String, dynamic> data);
}
