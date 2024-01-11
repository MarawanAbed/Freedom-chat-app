import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';
import 'package:freedom_chat_app/core/utils/constants.dart';
import 'package:freedom_chat_app/core/widgets/elevated_button.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../../../../core/widgets/image_logo.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HelperMethod.verticalSpace(40.0),
                const ImageLogo(),
                HelperMethod.verticalSpace(logoHeight),
                const Text(
                  'A verification email has been sent to. Please verify your email to continue.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                HelperMethod.verticalSpace(logoHeight),
                CustomElevatedButton(
                  title: 'Resend',
                  onPressed: () {},
                ),
                HelperMethod.verticalSpace(30.0),
                CustomElevatedButton(
                  title: 'Cancel',
                  colors: AppColors.kSecondaryColor,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
