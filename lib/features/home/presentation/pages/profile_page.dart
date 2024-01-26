import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/core/widgets/elevated_button.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/single_user/get_user_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/build_row_info.dart';

import '../../../../core/widgets/profile_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    var cubit = GetUserCubit.getUserCubit(context);
    cubit.getUser(cubit.getCurrentUserId()!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetUserCubit, GetUserState>(
        buildWhen: (previous, current) =>
            current is Success || current is Error || current is Loading,
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: () =>  ProfileBody(user:context.read<GetUserCubit>().userModel!,),
            error: (message) => Center(
              child: Text(message),
            ),
          );
        },
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key, required this.user,
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
                context.pushNamed(Routes.editProfileScreen,arguments: user);
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
    super.key, required this.user,
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


