import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';

import '../../../../../core/utils/sizes.dart';

class BuildForgetText extends StatelessWidget {
  const BuildForgetText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.enterEmail,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppSizes.fontSizeS16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}