import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/themes/styles.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
import 'package:freedom_chat_app/core/widgets/elevated_button.dart';
import 'package:freedom_chat_app/core/widgets/image_logo.dart';
import 'package:freedom_chat_app/features/auth/login/presentation/manager/login/login_cubit.dart';
import 'package:freedom_chat_app/features/auth/login/presentation/widgets/email_and_password.dart';
import 'package:freedom_chat_app/features/auth/login/presentation/widgets/login_bloc_listener.dart';

import '../widgets/build_row_logo.dart';
import '../widgets/dont_have_account.dart';
import '../widgets/forget_password_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.kDefaultAllPaddingS20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ImageLogo(),
                HelperMethod.verticalSpace(AppSizes.verticalSpacingS100),
                const EmailAndPassword(),
                HelperMethod.verticalSpace(AppSizes.verticalSpacingS30),
                CustomElevatedButton(
                  title: AppStrings.signIn,
                  onPressed: () {
                    cubit.loginMethod();
                  },
                ),
                HelperMethod.verticalSpace(AppSizes.verticalSpacingS10),
                const ForgetPasswordText(),
                HelperMethod.verticalSpace(AppSizes.verticalSpacingS10),
                const DontHaveAccount(),
                const Divider(
                  color: Colors.grey,
                ),
                HelperMethod.verticalSpace(AppSizes.verticalSpacingS10),
                Text(
                  AppStrings.orSignInWith,
                  style: TextStyles.font16NormalGrey,
                ),
                HelperMethod.verticalSpace(AppSizes.verticalSpacingS10),
                BuildRowLogo(cubit: cubit),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
