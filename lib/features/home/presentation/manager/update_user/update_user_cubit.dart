import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/domain/use_cases/log_out.dart';
import 'package:freedom_chat_app/features/home/domain/use_cases/update_email_and_password.dart';
import 'package:freedom_chat_app/features/home/domain/use_cases/update_user.dart';
import 'package:freedom_chat_app/features/home/domain/use_cases/upload_Image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_cubit.freezed.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit(this.updateUserUseCase, this.uploadImageUseCase, this.logOut,
      this.updateEmailAndPasswordUseCase)
      : super(const UpdateUserState.initial());

  static UpdateUserCubit get(context) => BlocProvider.of(context);

  final UpdateUserUseCase updateUserUseCase;
  final UploadImageUseCase uploadImageUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final UpdateEmailAndPasswordUseCase updateEmailAndPasswordUseCase;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final HomeLogOutUseCase logOut;
  File? profileImage;
  String? imageUrl;

  uploadImageMethod() async {
    if (profileImage == null) {
      return;
    }
    try {
      return imageUrl = await uploadImageUseCase.call(profileImage);
    } catch (e) {
      emit(UpdateUserState.uploadImageErrorState(e.toString()));
    }
  }

  Future<void> updateUserMethod(Map<String, dynamic> data) async {
    emit(const UpdateUserState.loading());
    try {
      await updateUserUseCase.call(data);
      emit(const UpdateUserState.success());
    } catch (e) {
      emit(UpdateUserState.error(e.toString()));
    }
  }

  Future<void> updateEmailAndPasswordMethod(UserModel userModel) async {
    emit(const UpdateUserState.loading());
    try {
      await updateEmailAndPasswordUseCase.call(userModel);
      emit(const UpdateUserState.updateEmailAndPasswordSuccessState());
    } catch (e) {
      emit(UpdateUserState.updateEmailAndPasswordErrorState(e.toString()));
    }
  }


  Future<void> logOutMethod() async {
    emit(const UpdateUserState.loading());
    try {
      await logOut.call();
    } catch (e) {
      emit(UpdateUserState.error(e.toString()));
    }
  }

  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
