import 'dart:io';

import 'package:freedom_chat_app/features/auth/register/data/data_sources/remote_data_source.dart';
import 'package:freedom_chat_app/features/auth/register/domain/repositories/register_repo.dart';

import '../../../../home/data/models/user_model.dart';

class RegisterRepoImpl implements RegisterRepo
{
  final RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepoImpl( this.registerRemoteDataSource);
  @override
  Future<void> register(UserModel userModel)async {
    await registerRemoteDataSource.register(userModel);
  }

  @override
  Future<String> uploadImage(File imageFile)async {
    return await registerRemoteDataSource.uploadImage(imageFile);
  }

  @override
  Future<void> createUser(UserModel userModel)async {
    await registerRemoteDataSource.createUser(userModel);
  }

}