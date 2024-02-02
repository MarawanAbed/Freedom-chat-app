import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/single_user/get_user_cubit.dart';

import '../widgets/profile_body.dart';

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
            success: (users) => ProfileBody(
              user: users,
            ),
            error: (message) => Center(
              child: Text(message),
            ),
          );
        },
      ),
    );
  }
}
