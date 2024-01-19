import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';
import 'package:freedom_chat_app/core/utils/constants.dart';
import 'package:freedom_chat_app/core/widgets/elevated_button.dart';
import 'package:freedom_chat_app/core/widgets/image_logo.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImageLogo(),
              HelperMethod.verticalSpace(90),
              CustomElevatedButton(
                title: 'Sign in',
                onPressed: () {
                  context.pushNamed(Routes.signInScreen);
                },
              ),
              HelperMethod.verticalSpace(20),
              CustomElevatedButton(
                title: 'Sign up',
                onPressed: () {
                  context.pushNamed(Routes.signUpScreen);
                },
                colors: AppColors.kSecondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
