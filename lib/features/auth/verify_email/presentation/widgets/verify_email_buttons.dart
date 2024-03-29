import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
import 'package:freedom_chat_app/features/auth/verify_email/presentation/manager/verify_email_cubit.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/widgets/elevated_button.dart';

class VerifyEmailButtons extends StatefulWidget {
  const VerifyEmailButtons({super.key});

  @override
  State<VerifyEmailButtons> createState() => _VerifyEmailButtonsState();
}

class _VerifyEmailButtonsState extends State<VerifyEmailButtons> {

  @override
  Widget build(BuildContext context) {
    var cubit = VerifyEmailCubit.get(context);
    return Column(
      children: [
        HelperMethod.verticalSpace(AppSizes.verticalSpacingS30),
        CustomElevatedButton(
          title: AppStrings.cancel,
          colors: AppColors.kSecondaryColor,
          onPressed: () {
            cubit.logOutMethod();
          },
        ),
      ],
    );
  }
}
