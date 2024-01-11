import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/utils/constants.dart';
import 'package:freedom_chat_app/core/widgets/elevated_button.dart';
import 'package:freedom_chat_app/core/widgets/image_logo.dart';
import 'package:freedom_chat_app/features/auth/login/presentation/manager/login/login_cubit.dart';
import 'package:freedom_chat_app/features/auth/login/presentation/widgets/email_and_password.dart';
import 'package:freedom_chat_app/features/auth/login/presentation/widgets/login_bloc_listener.dart';
import 'package:freedom_chat_app/features/auth/login/presentation/widgets/logo_button.dart';

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
          padding: const EdgeInsets.all(kDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ImageLogo(),
                HelperMethod.verticalSpace(logoHeight),
                const EmailAndPassword(),
                HelperMethod.verticalSpace(verticalSpacing * 1.5),
                CustomElevatedButton(
                  title: 'Sign in',
                  onPressed: () {
                    cubit.loginMethod();
                  },
                ),
                HelperMethod.verticalSpace(buttonSpacing),
                const ForgetPasswordText(),
                HelperMethod.verticalSpace(buttonSpacing),
                const DontHaveAccount(),
                const Divider(
                  color: Colors.grey,
                ),
                HelperMethod.verticalSpace(buttonSpacing),
                const Text(
                  'Or sign in with',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                HelperMethod.verticalSpace(buttonSpacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogoButton(
                      icon: FontAwesomeIcons.google,
                      color: Colors.red,
                      onPressed: () {
                        cubit.googleSignInMethod();
                      },
                    ),
                    HelperMethod.horizontalSpace(10),
                     LogoButton(
                      icon: FontAwesomeIcons.twitter,
                      color: Colors.blue,
                      onPressed: () {
                        cubit.twitterSignInMethod();
                      },
                    ),
                    HelperMethod.horizontalSpace(10),
                    LogoButton(
                      onPressed: () {
                        cubit.gitHubSignInMethod(context);
                      },
                      icon: FontAwesomeIcons.github,
                      color: Colors.grey,
                    ),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
