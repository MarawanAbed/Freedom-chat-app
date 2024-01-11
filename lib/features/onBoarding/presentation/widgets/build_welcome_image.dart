import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/assets/generated/assets.dart';

class BuildWelcomeImage extends StatelessWidget {
  const BuildWelcomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesWelcomeImage,
      fit: BoxFit.cover,
    );
  }
}
