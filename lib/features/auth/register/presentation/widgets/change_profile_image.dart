import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
import 'package:freedom_chat_app/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:freedom_chat_app/core/widgets/please_pick_image.dart';
import 'package:freedom_chat_app/core/widgets/profile_image.dart';

class ChangeProfileImage extends StatefulWidget {
  const   ChangeProfileImage({super.key});

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
      HelperMethod.showErrorToast(AppStrings.errorPickedImage,
          gravity: ToastGravity.BOTTOM);
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
          radius: AppSizes.profileRadius,
        ),
        HelperMethod.verticalSpace(AppSizes.verticalSpacingS10),
        ChooseProfileImage(
          onTap: () async {
            await pickedImage();
          },
        ),
      ],
    );
  }
}
