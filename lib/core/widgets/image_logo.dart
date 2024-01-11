import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freedom_chat_app/core/assets/generated/assets.dart';

class ImageLogo extends StatelessWidget {
  const ImageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return SvgPicture.asset(
      brightness == Brightness.dark
          ? Assets.iconsLogoDarkTheme
          : Assets.iconsLogoLightTheme,
      height: 100.h,
      width: 100.w,
    );
  }
}
