import 'dart:io';

import 'package:freedom_chat_app/core/services/firebase_serivces.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

abstract class RegisterRemoteDataSource {
  Future<void> register(UserModel userModel);

  Future<String> uploadImage(File imageFile);

  Future<void> createUser(UserModel userModel);
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final AuthService auth;
  final StorageService storage;

  final DatabaseService databaseService;

  RegisterRemoteDataSourceImpl(
      {required this.auth,
      required this.storage,
      required this.databaseService});

  @override
  Future<void> register(UserModel userModel) async {
    await auth.signUp(
      email: userModel.email!,
      password: userModel.password!,
    );
  }

  @override
  Future<String> uploadImage(File imageFile) async {
    return await storage.uploadImage(imageFile);
  }

  @override
  Future<void> createUser(UserModel userModel) async {
    await databaseService.createUser(userModel);
  }
}
