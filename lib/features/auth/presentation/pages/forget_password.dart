import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';
import 'package:freedom_chat_app/core/widgets/app_text_form.dart';
import 'package:freedom_chat_app/core/widgets/elevated_button.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/image_logo.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ImageLogo(),
                  HelperMethod.verticalSpace( 70),
                  const BuildForgetText(),
                  HelperMethod.verticalSpace( 40),
                  AppTextFormField(
                    hintText: 'Email',
                    backgroundColor: theme
                        ? AppColors.kField2
                        : Colors.white,
                    hintStyle: theme
                        ?  TextStyle(color: Colors.white, fontSize: 14.sp)
                        :  TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  HelperMethod.verticalSpace( 40),
                  CustomElevatedButton(
                    title: 'Send',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
