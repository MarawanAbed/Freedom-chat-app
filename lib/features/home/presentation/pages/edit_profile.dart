import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freedom_chat_app/core/assets/generated/assets.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';
import 'package:freedom_chat_app/core/widgets/app_text_form.dart';
import 'package:freedom_chat_app/core/widgets/elevated_button.dart';

import '../../../auth/register/presentation/widgets/please_pick_image.dart';
import '../../../auth/register/presentation/widgets/profile_image.dart';



class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileImage(
                image: AssetImage(Assets.imagesUser),
                radius: 50,
              ),
              HelperMethod.verticalSpace(20),
              const ChooseProfileImage(),
              HelperMethod.verticalSpace(20),
              AppTextFormField(
                hintText: 'Name',
                inputTextStyle: theme
                    ? TextStyle(color: Colors.white, fontSize: 14.sp)
                    : TextStyle(color: Colors.black, fontSize: 14.sp),
                backgroundColor: theme ? AppColors.kField2 : Colors.white,
                hintStyle: theme
                    ? TextStyle(color: Colors.white, fontSize: 14.sp)
                    : TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
              HelperMethod.verticalSpace(20),
              AppTextFormField(
                hintText: 'Email',
                inputTextStyle: theme
                    ? TextStyle(color: Colors.white, fontSize: 14.sp)
                    : TextStyle(color: Colors.black, fontSize: 14.sp),
                backgroundColor: theme ? AppColors.kField2 : Colors.white,
                hintStyle: theme
                    ? TextStyle(color: Colors.white, fontSize: 14.sp)
                    : TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
              HelperMethod.verticalSpace(20),
              AppTextFormField(
                hintText: 'Password',
                inputTextStyle: theme
                    ? TextStyle(color: Colors.white, fontSize: 14.sp)
                    : TextStyle(color: Colors.black, fontSize: 14.sp),
                backgroundColor: theme ? AppColors.kField2 : Colors.white,
                hintStyle: theme
                    ? TextStyle(color: Colors.white, fontSize: 14.sp)
                    : TextStyle(color: Colors.grey, fontSize: 14.sp),
                isObscureText: obscureText,
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
              HelperMethod.verticalSpace(20),
              AppTextFormField(
                hintText: 'Phone Number',
                inputTextStyle: theme
                    ? TextStyle(color: Colors.white, fontSize: 14.sp)
                    : TextStyle(color: Colors.black, fontSize: 14.sp),
                backgroundColor: theme ? AppColors.kField2 : Colors.white,
                hintStyle: theme
                    ? TextStyle(color: Colors.white, fontSize: 14.sp)
                    : TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
              HelperMethod.verticalSpace(30),
              CustomElevatedButton(
                title: 'Save Changes',
                onPressed: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
