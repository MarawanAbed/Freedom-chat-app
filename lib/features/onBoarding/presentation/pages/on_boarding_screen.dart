import 'package:flutter/material.dart';
import 'package:freedom_chat_app/features/onBoarding/presentation/widgets/build_skip_button.dart';
import 'package:freedom_chat_app/features/onBoarding/presentation/widgets/build_welcome_image.dart';
import 'package:freedom_chat_app/features/onBoarding/presentation/widgets/build_welcome_text.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 2),
            BuildWelcomeImage(),
            Spacer(flex: 2),
            BuildWelcomeText(),
            Spacer(flex: 1),
            Spacer(flex: 4),
            BuildSkipButton(),
          ],
        ),
      ),
    );
  }
}
