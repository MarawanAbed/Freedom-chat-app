import 'dart:io';

import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/auth/register/domain/repositories/register_repo.dart';

class RegisterUploadImageUseCase extends UseCase<Future<String>, File> {
  final RegisterRepo _registerRepo;

  RegisterUploadImageUseCase(this._registerRepo);

  @override
  Future<String> call([File? parameter]) async {
    return await _registerRepo.uploadImage(parameter!);
  }
}