import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';
import 'package:freedom_chat_app/core/utils/constants.dart';
import 'package:freedom_chat_app/core/widgets/app_text_form.dart';
import 'package:freedom_chat_app/core/widgets/elevated_button.dart';
import 'package:freedom_chat_app/core/widgets/image_logo.dart';
import 'package:freedom_chat_app/features/auth/presentation/widgets/profile_image.dart';

import '../widgets/already_have_account.dart';
import '../widgets/please_pick_image.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HelperMethod.verticalSpace(verticalSpacing),
                  const ImageLogo(),
                  HelperMethod.verticalSpace(30),
                  const ProfileImage(
                    image: null,
                    radius: 50,
                  ),
                  HelperMethod.verticalSpace(10),
                  const ChooseProfileImage(),
                  HelperMethod.verticalSpace(verticalSpacing),
                  AppTextFormField(
                    hintText: 'Name',
                    inputTextStyle: theme
                        ? TextStyle(color: Colors.white, fontSize: 14.sp)
                        : TextStyle(color: Colors.black, fontSize: 14.sp),
                    backgroundColor: theme ? AppColors.kField2 : Colors.white,
                    hintStyle: theme
                        ? TextStyle(color: Colors.white, fontSize: 14.sp)
                        : TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  HelperMethod.verticalSpace(verticalSpacing),
                  AppTextFormField(
                    hintText: 'Email',
                    inputTextStyle: theme
                        ? TextStyle(color: Colors.white, fontSize: 14.sp)
                        : TextStyle(color: Colors.black, fontSize: 14.sp),
                    backgroundColor: theme ? AppColors.kField2 : Colors.white,
                    hintStyle: theme
                        ? TextStyle(color: Colors.white, fontSize: 14.sp)
                        : TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  HelperMethod.verticalSpace(verticalSpacing),
                  AppTextFormField(
                    hintText: 'Password',
                    inputTextStyle: theme
                        ? TextStyle(color: Colors.white, fontSize: 14.sp)
                        : TextStyle(color: Colors.black, fontSize: 14.sp),
                    backgroundColor: theme ? AppColors.kField2 : Colors.white,
                    hintStyle: theme
                        ? TextStyle(color: Colors.white, fontSize: 14.sp)
                        : TextStyle(color: Colors.grey, fontSize: 14.sp),
                    isObscureText: obscureText,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        size: 20.sp,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                  HelperMethod.verticalSpace(verticalSpacing),
                  AppTextFormField(
                    hintText: 'Phone Number',
                    inputTextStyle: theme
                        ? TextStyle(color: Colors.white, fontSize: 14.sp)
                        : TextStyle(color: Colors.black, fontSize: 14.sp),
                    backgroundColor: theme ? AppColors.kField2 : Colors.white,
                    hintStyle: theme
                        ? TextStyle(color: Colors.white, fontSize: 14.sp)
                        : TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  HelperMethod.verticalSpace(30),
                  CustomElevatedButton(
                    title: 'Sign Up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Implement sign-in logic here
                      }
                    },
                  ),
                  HelperMethod.verticalSpace(buttonSpacing),
                  const AlreadyHaveAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
