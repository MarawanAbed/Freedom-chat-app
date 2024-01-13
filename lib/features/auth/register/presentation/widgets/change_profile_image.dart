import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:freedom_chat_app/features/auth/register/presentation/widgets/please_pick_image.dart';
import 'package:freedom_chat_app/features/auth/register/presentation/widgets/profile_image.dart';

class ChangeProfileImage extends StatefulWidget {
  const ChangeProfileImage({super.key});

  @override
  State<ChangeProfileImage> createState() => _ChangeProfileImageState();
}

class _ChangeProfileImageState extends State<ChangeProfileImage> {

  @override
  initState() {
    var cubit = RegisterCubit.of(context);
    cubit.profileImage = null;
    super.initState();
  }

  pickedImage() async {
    try {
      var cubit = RegisterCubit.of(context);
      File? newProfileImage = await HelperMethod.getImageFromGallery();
      setState(() {
        cubit.profileImage = newProfileImage;
      });
    } catch (e) {
      HelperMethod.showErrorToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.of(context);
    return Column(
      children: [
        ProfileImage(
          image: cubit.profileImage == null
              ? null
              : FileImage(cubit.profileImage!),
          radius: 50,
        ),
        HelperMethod.verticalSpace(10),
        ChooseProfileImage(
          onTap: () async {
            await pickedImage();
          },
        ),
      ],
    );
  }
}
