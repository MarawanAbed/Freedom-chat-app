import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/features/auth/verify_email/presentation/manager/verify_email_cubit.dart';
import 'package:freedom_chat_app/features/auth/verify_email/presentation/widgets/verify_email_BlocLisener.dart';
import 'package:freedom_chat_app/features/auth/verify_email/presentation/widgets/verify_email_buttons.dart';
import 'package:freedom_chat_app/features/auth/verify_email/presentation/widgets/verify_email_text.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../core/widgets/image_logo.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  void initState() {
    var cubit = VerifyEmailCubit.get(context);
    cubit.sendVerificationEmail();
    cubit.startEmailVerificationCheckTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.kDefaultAllPaddingS20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HelperMethod.verticalSpace(AppSizes.verticalSpacingS40),
                const ImageLogo(),
                HelperMethod.verticalSpace(AppSizes.verticalSpacingS100),
                const VerifyEmailTexts(),
                HelperMethod.verticalSpace(AppSizes.verticalSpacingS100),
                const VerifyEmailButtons(),
                const VerifyEmailBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
