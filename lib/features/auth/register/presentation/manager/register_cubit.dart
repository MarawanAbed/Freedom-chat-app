import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/auth/register/domain/use_cases/create_user.dart';
import 'package:freedom_chat_app/features/auth/register/domain/use_cases/register.dart';
import 'package:freedom_chat_app/features/auth/register/domain/use_cases/upload_image.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_cubit.freezed.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
      {required this.registerUseCase,
      required this.uploadImageUseCase,
      required this.createUserUseCase})
      : super(const RegisterState.initial());

  static RegisterCubit of(context) => BlocProvider.of<RegisterCubit>(context);

  final CreateUserUseCase createUserUseCase;
  final RegisterUseCase registerUseCase;
  final RegisterUploadImageUseCase uploadImageUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  File? profileImage;
  final registerFormKey = GlobalKey<FormState>();

  void registerMethod(UserModel userModel) async {
    emit(const RegisterState.loading());
    try {
      await registerUseCase.call(
        userModel,
      );
      createUser(userModel);
      emit(const RegisterState.success());
    } catch (e) {
      emit(RegisterState.error(e.toString()));
    }
  }

  String? imageUrl;

  uploadImageMethod() async {
    if (profileImage == null) {
      return;
    }
    try {
      return imageUrl = await uploadImageUseCase.call(profileImage);
    } catch (e) {
      emit(RegisterState.uploadImageErrorState(e.toString()));
    }
  }

  void createUser(UserModel userModel) async {
    try {
      await createUserUseCase.call(
        userModel,
      );
    } catch (e) {
      emit(RegisterState.error(e.toString()));
    }
  }

  @override
  void emit(RegisterState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
