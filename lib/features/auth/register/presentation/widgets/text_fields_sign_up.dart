import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/helpers/validation.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';
import 'package:freedom_chat_app/core/utils/constants.dart';
import 'package:freedom_chat_app/core/widgets/app_text_form.dart';
import 'package:freedom_chat_app/features/auth/register/presentation/manager/register_cubit.dart';

class TextFieldSignUp extends StatefulWidget {
  const TextFieldSignUp({super.key});

  @override
  State<TextFieldSignUp> createState() => _TextFieldSignUpState();
}

class _TextFieldSignUpState extends State<TextFieldSignUp> {
  bool obscureText = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    emailController = RegisterCubit.of(context).emailController;
    passwordController = RegisterCubit.of(context).passwordController;
    nameController = RegisterCubit.of(context).nameController;
    descriptionController = RegisterCubit.of(context).descriptionController;

    passwordController.clear();
    nameController.clear();
    descriptionController.clear();
    emailController.clear();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).brightness == Brightness.dark;
    var cubit = RegisterCubit.of(context);
    return Form(
      key: cubit.registerFormKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: nameController,
            hintText: 'Name',
            inputTextStyle: theme
                ? TextStyle(color: Colors.white, fontSize: 14.sp)
                : TextStyle(color: Colors.black, fontSize: 14.sp),
            backgroundColor: theme ? AppColors.kField2 : Colors.white,
            hintStyle: theme
                ? TextStyle(color: Colors.white, fontSize: 14.sp)
                : TextStyle(color: Colors.grey, fontSize: 14.sp),
            validator: (name) => Validation.validateRequired(name ?? ''),
          ),
          HelperMethod.verticalSpace(verticalSpacing),
          AppTextFormField(
            controller: descriptionController,
            hintText: 'Description',
            inputTextStyle: theme
                ? TextStyle(color: Colors.white, fontSize: 14.sp)
                : TextStyle(color: Colors.black, fontSize: 14.sp),
            backgroundColor: theme ? AppColors.kField2 : Colors.white,
            hintStyle: theme
                ? TextStyle(color: Colors.white, fontSize: 14.sp)
                : TextStyle(color: Colors.grey, fontSize: 14.sp),
            validator: (description) => Validation.validateRequired(description ?? ''),
          ),
          HelperMethod.verticalSpace(verticalSpacing),
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
