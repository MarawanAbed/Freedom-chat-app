import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom_chat_app/core/di/dependancy_injection.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/update_users/update_user_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/change_profile_image.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/edit_profile_bloc_listener.dart';

import '../../../../core/widgets/elevated_button.dart';
import '../widgets/edit_profile_text_fields.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.user});

  final UserModel user;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late UpdateUserCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt<UpdateUserCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user = widget.user;

    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.editProfile),
        ),
        body: Padding(
          padding: EdgeInsets.all(AppSizes.kDefaultAllPaddingS20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HelperMethod.verticalSpace(AppSizes.verticalSpacingS20),
                ChangeProfileImage(image: user.image!),
                HelperMethod.verticalSpace(AppSizes.verticalSpacingS20),
                EdtProfileTextForm(
                  user: user,
                ),
                HelperMethod.verticalSpace(AppSizes.verticalSpacingS30),
                CustomElevatedButton(
                  title: AppStrings.saveChanges,
                  onPressed: () async {
                    _saveChanges(context).then((_) => context.pop());
                  },
                ),
                HelperMethod.verticalSpace(AppSizes.verticalSpacingS10),
                Text(
                  AppStrings.note,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const EditProfileBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveChanges(BuildContext context) async {
    final user = UserModel(
      uId: widget.user.uId,
      name: cubit.nameController.text ?? widget.user.name,
      email: cubit.emailController.text ?? widget.user.email,
      image: cubit.profileImage != null
          ? await cubit.uploadImageMethod()
          : widget.user.image,
      password: cubit.passwordController.text ?? widget.user.password,
      description: cubit.descriptionController.text ?? widget.user.description,
      isOnline: widget.user.isOnline,
      lastActive: widget.user.lastActive,
    );

    // Update email and password
    if (cubit.emailController.text != widget.user.email ||
        cubit.passwordController.text != widget.user.password) {
      cubit.updateEmailAndPasswordMethod(user).then((_) {
        cubit.logOutMethod();
        HelperMethod.showSuccessToast(
            AppStrings.emailAndPasswordUpdated,
            gravity: ToastGravity.BOTTOM);
      });
    }

    cubit.updateUserMethod(user.toJson()).then((_) {
      HelperMethod.showSuccessToast(AppStrings.profileUpdatedSuccessfully,
          gravity: ToastGravity.BOTTOM);
    });
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }
}
