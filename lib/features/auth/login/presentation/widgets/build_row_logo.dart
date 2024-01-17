import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../manager/login/login_cubit.dart';
import 'logo_button.dart';

class BuildRowLogo extends StatelessWidget {
  const BuildRowLogo({
    super.key,
    required this.cubit,
  });

  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
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
      ],
    );
  }
}