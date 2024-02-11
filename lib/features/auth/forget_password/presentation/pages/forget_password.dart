import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/features/auth/forget_password/presentation/widgets/email_text_field.dart';
import 'package:freedom_chat_app/features/auth/forget_password/presentation/widgets/forget_password_bloc_listener.dart';

import '../../../../../core/utils/sizes.dart';
import '../../../../../core/widgets/image_logo.dart';
import '../widgets/build_forget_text.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(AppSizes.kDefaultAllPaddingS20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ImageLogo(),
                  HelperMethod.verticalSpace(AppSizes.verticalSpacingS70),
                  const BuildForgetText(),
                  HelperMethod.verticalSpace(AppSizes.verticalSpacingS40),
                  const EmailTextFieldAndButton(),
                  const ForgetPasswordBLocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
