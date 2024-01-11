import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/themes/app_colors.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account?',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.signUpScreen);
          },
          child:  const Text(
            'Sign Up',
            style: TextStyle(
              color: AppColors.kPrimaryColorWithOpacity,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}