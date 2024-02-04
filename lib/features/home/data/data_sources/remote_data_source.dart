import 'dart:io';

import 'package:freedom_chat_app/core/services/firebase_serivces.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

abstract class HomeRemoteDataSource {
  Stream<List<UserModel>> getAllUsers();

  Stream<UserModel> getUser(String uid);

  Future<void> logOut();

  String? getCurrentUserId();

  Future<void>updateEmailAndPassword({required String email,required String password});


  Future<String> uploadImage(File imageFile);

  Future<void> updateUser(Map<String, dynamic> data);

  Stream<List<UserModel>> searchUsers({required String name});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DatabaseService databaseService;
  final AuthService authService;
  final StorageService storeService;
  HomeRemoteDataSourceImpl({required this.databaseService,required this.storeService,required this.authService});

  @override
  Stream<List<UserModel>> getAllUsers() {
    return databaseService.getAllUsers();
  }

  @override
  Stream<UserModel> getUser(String uid) {
    return databaseService.getSingleUser(uid);
  }

  @override
  Future<void> updateUser(Map<String, dynamic> data) async {
    await databaseService.updateUser(data);
  }

  @override
  String? getCurrentUserId() {
    return authService.getCurrentUserId();
  }

  @override
  Future<void> logOut()async {
    return await authService.signOut();
  }

  @override
  Future<String> uploadImage(File imageFile)async{
    return await storeService.uploadImage(imageFile);
  }

  @override
  Future<void> updateEmailAndPassword({required String email, required String password})async {
    return await authService.updateEmailAndPassword(email: email, password: password);
  }

  @override
  Stream<List<UserModel>> searchUsers({required String name}) {
    return databaseService.searchUsers(name: name);
  }
}
