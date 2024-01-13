import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';
import 'package:freedom_chat_app/core/themes/styles.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.forgotPasswordScreen);
      },
      child: Text(
        AppStrings.forgetPassword,
        style: TextStyles.font16NormalGrey.copyWith(
          color: AppColors.kPrimaryColorWithOpacity,
        ),
      ),
    );
  }
}
