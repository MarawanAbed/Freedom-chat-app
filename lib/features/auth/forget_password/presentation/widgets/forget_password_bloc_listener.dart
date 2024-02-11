import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
import 'package:freedom_chat_app/features/auth/forget_password/presentation/manager/forget_password_cubit.dart';

class ForgetPasswordBLocListener extends StatelessWidget {
  const ForgetPasswordBLocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (){
            HelperMethod.showLoadingDialog(context);
          },
          success: (){
            Navigator.pop(context);
            HelperMethod.showSuccessToast(AppStrings.checkYourEmail,gravity: ToastGravity.BOTTOM);
          },
          error: (message){
            Navigator.pop(context);
            HelperMethod.showErrorToast(message,gravity: ToastGravity.BOTTOM);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
