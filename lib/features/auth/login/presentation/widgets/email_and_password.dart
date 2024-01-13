import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/helpers/validation.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';
import 'package:freedom_chat_app/core/utils/constants.dart';
import 'package:freedom_chat_app/core/widgets/app_text_form.dart';
import 'package:freedom_chat_app/features/auth/login/presentation/manager/login/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool obscureText = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = LoginCubit.of(context).emailController;
    passwordController = LoginCubit.of(context).passwordController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).brightness == Brightness.dark;
    var cubit = LoginCubit.of(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: emailController,
            hintText: 'Email',
            inputTextStyle: _inputColor(theme),
            backgroundColor: theme ? AppColors.kField2 : Colors.white,
            hintStyle: _hintStyle(theme),
            validator: (email) => Validation.validateEmail(email ?? ''),
          ),
          HelperMethod.verticalSpace(verticalSpacing),
          AppTextFormField(
            controller: passwordController,
            hintText: 'Password',
            inputTextStyle: _inputColor(theme),
            backgroundColor: theme ? AppColors.kField2 : Colors.white,
            hintStyle: _hintStyle(theme),
            isObscureText: obscureText,
            validator: (password) => Validation.validatePassword(password ?? ''),
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
        ],
      ),
    );
  }
  TextStyle _hintStyle(bool theme) {
    return theme
        ? TextStyle(color: Colors.white, fontSize: 14.sp)
        : TextStyle(color: Colors.grey, fontSize: 14.sp);
  }

  TextStyle _inputColor(bool theme) {
    return theme
        ? TextStyle(color: Colors.white, fontSize: 14.sp)
        : TextStyle(color: Colors.black, fontSize: 14.sp);
  }
}
