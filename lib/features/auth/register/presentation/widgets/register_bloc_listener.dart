
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/features/auth/register/presentation/manager/register_cubit.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key,});


  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is Success ||
          current is Error ||
          current is UploadImageLoadingState ||
          current is UploadImageSuccessState ||
          current is UploadImageErrorState,
      listener: (BuildContext context, state) {
        state.whenOrNull(
          loading: () {
            HelperMethod.showLoadingDialog(context);
          },
          success: () {
            Navigator.pop(context);
            HelperMethod.showSuccessToast(
              'Register Success Now you Can Login',
              gravity: ToastGravity.BOTTOM,
            );
            context.pushReplacementNamed(Routes.signInScreen);
          },
          error: (message) {
            Navigator.pop(context);
            HelperMethod.showErrorToast(message, gravity: ToastGravity.BOTTOM);
          },
          uploadImageErrorState: (message) {
            HelperMethod.showErrorToast(message, gravity: ToastGravity.BOTTOM);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
