import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom_chat_app/core/di/dependancy_injection.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/core/services/firebase_serivces.dart';
import 'package:freedom_chat_app/features/auth/verify_email/presentation/manager/verify_email_cubit.dart';

class VerifyEmailBlocListener extends StatelessWidget {
  const VerifyEmailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyEmailCubit, VerifyEmailState>(
      listener: (BuildContext context, state) {
        state.whenOrNull(
          verificationEmailSentState: () {
            HelperMethod.showSuccessToast(
                'Verification email sent to ${getIt<AuthService>().auth.currentUser!.email}',
                gravity: ToastGravity.BOTTOM);
          },
          verificationEmailResentState: (){
            HelperMethod.showSuccessToast(
              'Verification email resent to ${getIt<AuthService>().auth.currentUser!.email}',
              gravity: ToastGravity.BOTTOM,
            );
          },
          verificationSuccessState: () {
            HelperMethod.showSuccessToast(
              'Verification success',
              gravity: ToastGravity.BOTTOM,
            );
            context.pushReplacementNamed(Routes.signInScreen);
          },
          verificationErrorState: (message) {
            HelperMethod.showErrorToast(message);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
