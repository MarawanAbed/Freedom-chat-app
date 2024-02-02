import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/elevated_button.dart';
import '../../../../core/widgets/profile_image.dart';
import '../../data/models/user_model.dart';
import 'build_row_info.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(user: user),
            HelperMethod.verticalSpace(30),
            BuildRowInfo(user: user),
            HelperMethod.verticalSpace(30),
            CustomElevatedButton(
              onPressed: () {
                context.pushNamed(Routes.editProfileScreen, arguments: user);
              },
              title: 'Edit Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileImage(
          image: NetworkImage(user.image!),
          radius: 50,
        ),
        HelperMethod.verticalSpace(30),
        Text(
          user.name!,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
