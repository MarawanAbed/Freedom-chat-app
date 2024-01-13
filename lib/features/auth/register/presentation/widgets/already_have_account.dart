import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/core/themes/styles.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';

import '../../../../../core/themes/app_colors.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.alreadyHaveAccount,
          style: TextStyles.font16NormalGrey,
        ),
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.signInScreen);
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
