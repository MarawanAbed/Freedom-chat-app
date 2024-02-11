import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
import 'package:freedom_chat_app/core/widgets/elevated_button.dart';
import 'package:freedom_chat_app/core/widgets/image_logo.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.kDefaultAllPaddingS20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImageLogo(),
              HelperMethod.verticalSpace(AppSizes.verticalSpacingS90),
              CustomElevatedButton(
                title: AppStrings.signIn,
                onPressed: () {
                  context.pushNamed(Routes.signInScreen);
                },
              ),
              HelperMethod.verticalSpace(AppSizes.verticalSpacingS20),
              CustomElevatedButton(
                title: AppStrings.signUp,
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
