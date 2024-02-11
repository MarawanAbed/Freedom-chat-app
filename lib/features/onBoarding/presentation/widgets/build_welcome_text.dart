import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/themes/styles.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';

class BuildWelcomeText extends StatelessWidget {
  const BuildWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.onBoardingTitle,
          textAlign: TextAlign.center,
          style: TextStyles.font20Bold,
        ),
        HelperMethod.verticalSpace(AppSizes.verticalSpacingS10),
        Text(
          AppStrings.onBoardingSubtitle,
          textAlign: TextAlign.center,
          style: TextStyles.font18NormalGrey,
        ),
      ],
    );
  }
}
