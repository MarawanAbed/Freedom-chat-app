import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/all_users/get_all_user_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/build_user_item.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    var cubit = GetAllUserCubit.get(context);
    cubit.getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUserCubit, GetAllUserState>(
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
          success: (users) => BuildUserItem(users: users),
          error: (message) => Center(
            child: Text(message),
          ),
        );
      },
    );
  }
}
