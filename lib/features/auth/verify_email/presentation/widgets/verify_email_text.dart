import 'package:flutter/material.dart';

class VerifyEmailTexts extends StatelessWidget {
  const VerifyEmailTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'A verification email has been sent to. Please verify your email to continue.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
      ),
    );
  }
}
