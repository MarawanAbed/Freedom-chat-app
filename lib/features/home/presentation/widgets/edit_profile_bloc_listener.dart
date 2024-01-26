import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/update_user/update_user_cubit.dart';

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
            HelperMethod.showSuccessToast('Profile Updated Successfully',
                gravity: ToastGravity.BOTTOM);
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
                'Email and Password Updated Successfully',
                gravity: ToastGravity.BOTTOM);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
