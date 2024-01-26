import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/core/di/dependancy_injection.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/all_users/get_all_user_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/users_item.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late GetAllUserCubit cubit;

  @override
  void initState() {
    cubit = getIt<GetAllUserCubit>();
    cubit.getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<GetAllUserCubit, GetAllUserState>(
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
              success: () => BuildUserItem(
                users: context.read<GetAllUserCubit>().usersModel,
              ),
              error: (message) => Center(
                child: Text(message),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }
}

class BuildUserItem extends StatelessWidget {
  const BuildUserItem({super.key, required this.users});

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => UserItems(
        user: users[index],
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: users.length,
    );
  }
}
