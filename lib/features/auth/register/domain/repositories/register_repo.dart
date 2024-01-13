import 'dart:io';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

abstract class RegisterRepo {
  Future<void> register(UserModel userModel);
  Future<String> uploadImage(File imageFile);
  Future<void> createUser(UserModel userModel);
}
