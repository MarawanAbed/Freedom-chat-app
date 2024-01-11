import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.forgotPasswordScreen);
      },
      child: const Text(
        'Forget Password ?',
        style: TextStyle(
          color: AppColors.kPrimaryColorWithOpacity,
          fontSize: 16,
        ),
      ),
    );
  }
}
