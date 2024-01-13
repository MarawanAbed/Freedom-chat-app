import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/assets/generated/assets.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/core/widgets/elevated_button.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/build_row_info.dart';

import '../../../auth/register/presentation/widgets/profile_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProfileImage(
                image: AssetImage(Assets.imagesUser),
                radius: 50,
              ),
              HelperMethod.verticalSpace(20),
              const Text(
                'Ahmed',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              HelperMethod.verticalSpace(30),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                  child: BuildRowInfo(
                    title: 'Email',
                    value: 'helllo',
                  ),
                ),
                separatorBuilder: (context, index) =>
                    HelperMethod.verticalSpace(20),
                itemCount: 3,
              ),
              HelperMethod.verticalSpace(30),
              CustomElevatedButton(
                onPressed: () {
                  context.pushNamed(Routes.editProfileScreen);
                },
                title: 'Edit Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
