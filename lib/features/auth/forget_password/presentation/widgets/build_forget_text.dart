import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class BuildForgetText extends StatelessWidget {
  const BuildForgetText({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        Text(
          'Enter your email address and we will send you a link to reset your password.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: kDefaultFontSize,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}