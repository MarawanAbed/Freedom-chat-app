import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/utils/constants.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
import 'package:freedom_chat_app/core/widgets/elevated_button.dart';
import 'package:freedom_chat_app/core/widgets/image_logo.dart';
import 'package:freedom_chat_app/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:freedom_chat_app/features/auth/register/presentation/widgets/change_profile_image.dart';
import 'package:freedom_chat_app/features/auth/register/presentation/widgets/text_fields_sign_up.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

import '../widgets/already_have_account.dart';
import '../widgets/register_bloc_listener.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HelperMethod.verticalSpace(verticalSpacing),
                const ImageLogo(),
                HelperMethod.verticalSpace(30),
                const ChangeProfileImage(),
                HelperMethod.verticalSpace(verticalSpacing),
                const TextFieldSignUp(),
                HelperMethod.verticalSpace(30),
                CustomElevatedButton(
                  title: AppStrings.signUp,
                  onPressed: () {
                    _signUpButton(context);
                  },
                ),
                HelperMethod.verticalSpace(buttonSpacing),
                const AlreadyHaveAccount(),
                const RegisterBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUpButton(context) async {
    var cubit = RegisterCubit.of(context);
    if (cubit.registerFormKey.currentState!.validate()) {
      if (cubit.profileImage != null) {
        await cubit.uploadImageMethod();
        if (cubit.imageUrl != null) {
          final userModel = UserModel(
            email: cubit.emailController.text.trim(),
            password: cubit.passwordController.text.trim(),
            name: cubit.nameController.text.trim(),
            description: cubit.descriptionController.text.trim(),
            image: cubit.imageUrl!,
            isOnline: true,
            uId: null,
            lastActive: DateTime.now(),
          );
          cubit.registerMethod(userModel);
        }
      } else {
        HelperMethod.showErrorToast(AppStrings.pleaseSelectImage,
            gravity: ToastGravity.BOTTOM);
      }
    }
  }
}
