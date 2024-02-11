import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/core/themes/styles.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuildSkipButton extends StatefulWidget {
  const BuildSkipButton({super.key});

  @override
  State<BuildSkipButton> createState() => _BuildSkipButtonState();
}

class _BuildSkipButtonState extends State<BuildSkipButton> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: TextButton(
        onPressed: () {
          _handleSkipButton().then(
            (_) => context.pushReplacementNamed(Routes.authScreen),
          );
        },
        child: Row(
          children: [
            Text(
              AppStrings.skip,
              style: TextStyles.font16NormalGrey,
            ),
            HelperMethod.horizontalSpace(AppSizes.horizontalSpacingS5),
            Icon(
              Icons.arrow_forward_ios,
              size: AppSizes.iconSizeS16,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _handleSkipButton() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(AppStrings.onBoardingKey, true);
  }
}
