import 'dart:io';

import 'package:freedom_chat_app/core/usecases/use_cases.dart';
import 'package:freedom_chat_app/features/home/domain/repositories/home_repo.dart';

class UploadImageUseCase extends UseCase<Future<String>,File>{

  final HomeRepo homeRepo;

  UploadImageUseCase(this.homeRepo);
  @override
  Future<String> call([File? parameter])async {
    return await homeRepo.uploadImage(parameter!);
  }

}