import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';

class BuildWelcomeText extends StatelessWidget {
  const BuildWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome to our freedom \nmessaging app',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        HelperMethod.verticalSpace(10),
        Text(
          'Freedom talk any person of your \nmother language.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
