import 'package:freedom_chat_app/core/services/firebase_serivces.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

abstract class HomeRemoteDataSource {
  Stream<List<UserModel>> getAllUsers();

  Stream<UserModel> getUser(String uid);

  Future<void> logOut();

  String? getCurrentUserId();

  Future<void> updateUser(Map<String, dynamic> data);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DatabaseService databaseService;
  final AuthService authService;
  HomeRemoteDataSourceImpl({required this.databaseService,required this.authService});

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
}
