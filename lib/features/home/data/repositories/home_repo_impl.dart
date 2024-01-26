import 'dart:io';

import 'package:freedom_chat_app/features/home/data/data_sources/remote_data_source.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

import '../../domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepoImpl(this.remoteDataSource);

  @override
  Stream<List<UserModel>> getAllUsers() {
    return remoteDataSource.getAllUsers();
  }

  @override
  Stream<UserModel> getUser(String uid) {
    return remoteDataSource.getUser(uid);
  }

  @override
  Future<void> updateUser(Map<String, dynamic> data) async {
    await remoteDataSource.updateUser(data);
  }

  @override
  String? getCurrentUserId() {
    return remoteDataSource.getCurrentUserId();
  }

  @override
  Future<void> logOut() async {
    return await remoteDataSource.logOut();
  }

  @override
  Future<String> uploadImage(File imageFile) async {
    return await remoteDataSource.uploadImage(imageFile);
  }

  @override
  Future<void> updateEmailAndPassword({required String email, required String password})async {
    return await remoteDataSource.updateEmailAndPassword(email: email, password: password);
  }

}
