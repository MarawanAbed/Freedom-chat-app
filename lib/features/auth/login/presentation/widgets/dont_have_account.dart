import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/themes/styles.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/themes/app_colors.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.dontHaveAccount,
          style: TextStyles.font16NormalGrey,
        ),
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.signUpScreen);
          },
          child: Text(
            AppStrings.signUp,
            style: TextStyles.font16NormalGrey.copyWith(
              color: AppColors.kPrimaryColorWithOpacity,
            ),
          ),
        ),
      ],
    );
  }
}
