import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/helpers/validation.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';
import 'package:freedom_chat_app/core/themes/styles.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
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
            hintText: AppStrings.name,
            inputTextStyle: _inputColor(theme),
            backgroundColor: theme ? AppColors.kField2 : Colors.white,
            hintStyle: _hintStyle(theme),
            validator: (name) => Validation.validateRequired(name ?? ''),
          ),
          HelperMethod.verticalSpace(AppSizes.verticalSpacingS20),
          AppTextFormField(
            controller: descriptionController,
            hintText: AppStrings.description,
            inputTextStyle: _inputColor(theme),
            backgroundColor: theme ? AppColors.kField2 : Colors.white,
            hintStyle: _hintStyle(theme),
            validator: (description) =>
                Validation.validateRequired(description ?? ''),
          ),
          HelperMethod.verticalSpace(AppSizes.verticalSpacingS20),
          AppTextFormField(
            controller: emailController,
            hintText: AppStrings.email,
            inputTextStyle: _inputColor(theme),
            backgroundColor: theme ? AppColors.kField2 : Colors.white,
            hintStyle: _hintStyle(theme),
            validator: (email) => Validation.validateEmail(email ?? ''),
          ),
          HelperMethod.verticalSpace(AppSizes.verticalSpacingS20),
          AppTextFormField(
            controller: passwordController,
            hintText: AppStrings.password,
            inputTextStyle: _inputColor(theme),
            backgroundColor: theme ? AppColors.kField2 : Colors.white,
            hintStyle: _hintStyle(theme),
            isObscureText: obscureText,
            validator: (password) =>
                Validation.validatePassword(password ?? ''),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                size: AppSizes.iconSizeS20,
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
        ? TextStyles.font14NormalGrey.copyWith(color: Colors.white)
        : TextStyles.font14NormalGrey;
  }

  TextStyle _inputColor(bool theme) {
    return theme
        ? TextStyles.font14NormalGrey.copyWith(color: Colors.white)
        : TextStyles.font14NormalGrey.copyWith(color: Colors.black);
  }
}
