import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';
import 'package:freedom_chat_app/core/themes/styles.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';

class ChooseProfileImage extends StatelessWidget {
  const ChooseProfileImage({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        AppStrings.chooseProfileImage,
        style: TextStyles.font18Bold.copyWith(
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
