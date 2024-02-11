import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/themes/styles.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';

class VerifyEmailTexts extends StatelessWidget {
  const VerifyEmailTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.verifyEmail,
      textAlign: TextAlign.center,
      style: TextStyles.font18Normal,
    );
  }
}
