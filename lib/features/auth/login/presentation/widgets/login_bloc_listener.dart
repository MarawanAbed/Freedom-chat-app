import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
import 'package:freedom_chat_app/features/auth/login/presentation/manager/login/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is Success ||
          current is Error ||
          current is SuccessWithGithub ||
          current is ErrorWithGithub,
      listener: (context, state) {
        state.whenOrNull(
          loading: () async {
            HelperMethod.showLoadingDialog(context);
          },
          success: () async {
            Navigator.pop(context);
            HelperMethod.showSuccessToast(
              AppStrings.loginSuccess,
              gravity: ToastGravity.BOTTOM,
            );
          },
          successWithGithub: () {
            HelperMethod.showSuccessToast(AppStrings.loginSuccess,
                gravity: ToastGravity.BOTTOM);
          },
          errorWithGithub: (message) {
            HelperMethod.showErrorToast(message, gravity: ToastGravity.BOTTOM);
          },
          error: (message) {
            Navigator.pop(context);
            HelperMethod.showErrorToast(message, gravity: ToastGravity.BOTTOM);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
