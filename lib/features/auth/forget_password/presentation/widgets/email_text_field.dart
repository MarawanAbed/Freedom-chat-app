import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/widgets/app_text_form.dart';
import '../../../../../core/widgets/elevated_button.dart';
import '../manager/forget_password_cubit.dart';

class EmailTextFieldAndButton extends StatefulWidget {
  const EmailTextFieldAndButton({super.key});

  @override
  State<EmailTextFieldAndButton> createState() => _EmailTextFieldAndButtonState();
}

class _EmailTextFieldAndButtonState extends State<EmailTextFieldAndButton> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).brightness == Brightness.dark;
    var cubit = ForgetPasswordCubit.get(context);
    return Column(
      children: [
        AppTextFormField(
          controller: emailController,
          hintText: 'Email',
          backgroundColor: theme ? AppColors.kField2 : Colors.white,
          hintStyle: theme
              ? TextStyle(color: Colors.white, fontSize: 14.sp)
              : TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),
        HelperMethod.verticalSpace(40),
        CustomElevatedButton(
          title: 'Send',
          onPressed: () {
            cubit.forgetPassword(emailController.text);
          },
        ),
      ],
    );
  }
}
