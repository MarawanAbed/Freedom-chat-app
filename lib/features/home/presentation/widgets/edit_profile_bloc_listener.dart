import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/update_users/update_user_cubit.dart';

class EditProfileBlocListener extends StatelessWidget {
  const EditProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateUserCubit, UpdateUserState>(
      listenWhen: (previous, current) {
        return current is Success ||
            current is Error ||
            current is UploadImageErrorState ||
            current is UpdateEmailAndPasswordErrorState ||
            current is UpdateEmailAndPasswordSuccessState ||
            current is Loading;
      },
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            const Center(child: CircularProgressIndicator());
          },
          success: () {
            HelperMethod.showSuccessToast(AppStrings.profileUpdatedSuccessfully,
                gravity: ToastGravity.BOTTOM,);
            context.pop();
          },
          error: (message) {
            HelperMethod.showErrorToast(message, gravity: ToastGravity.BOTTOM);
          },
          uploadImageErrorState: (message) {
            HelperMethod.showErrorToast(message, gravity: ToastGravity.BOTTOM);
          },
          updateEmailAndPasswordErrorState: (message) {
            HelperMethod.showErrorToast(message, gravity: ToastGravity.BOTTOM);
          },
          updateEmailAndPasswordSuccessState: () {
            HelperMethod.showSuccessToast(
                AppStrings.emailAndPasswordUpdated,
                gravity: ToastGravity.BOTTOM);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
