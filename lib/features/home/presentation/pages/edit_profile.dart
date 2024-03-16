import 'package:freedom_chat_app/lib_imports.dart';

import '../manager/update_users/update_user_cubit.dart';
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
    cubit = UpdateUserCubit.get(context);
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
                    await _saveChanges(context);
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
      cubit.updateEmailAndPasswordMethod(user).then((_) async {
        cubit.updateUserMethod(user.toJson());
        HelperMethod.showSuccessToast(AppStrings.emailAndPasswordUpdated,
            gravity: ToastGravity.BOTTOM);
      });
    } else {
      cubit.updateUserMethod(user.toJson()).then((_) {
        HelperMethod.showSuccessToast(AppStrings.profileUpdatedSuccessfully,
            gravity: ToastGravity.BOTTOM);
      });
    }
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }
}
