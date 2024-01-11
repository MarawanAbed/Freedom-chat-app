import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';

import '../../../../core/themes/app_colors.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account?',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.signInScreen);
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
