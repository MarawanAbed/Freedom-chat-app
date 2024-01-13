import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';

class ChooseProfileImage extends StatelessWidget {
  const ChooseProfileImage({super.key, this.onTap});

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap ,
      child: const Text(
        'Choose Profile Picture',
        style: TextStyle(color: AppColors.kPrimaryColor, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}