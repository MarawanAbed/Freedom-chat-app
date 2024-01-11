import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';

class BuildSkipButton extends StatelessWidget {
  const BuildSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: TextButton(
        onPressed: () {
          context.pushReplacementNamed(Routes.authScreen);
        },
        child: Row(
          children: [
            Text(
              "Skip",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
              ),
            ),
            HelperMethod.horizontalSpace(5),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
