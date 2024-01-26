import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/core/di/dependancy_injection.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/all_users/get_all_user_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/people_users_item.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late GetAllUserCubit cubit;

  @override
  void initState() {
    cubit = getIt<GetAllUserCubit>();
    cubit.getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
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
              success: () => BuildPeople(users: context.read<GetAllUserCubit>().usersModel),
              error: (message) => Center(
                child: Text(message),
              ),
            );
          },
        ),
      ),
    );
  }
  @override
  void dispose()
  {
    cubit.close();
    super.dispose();
  }
}

class BuildPeople extends StatelessWidget {
  const BuildPeople({
    super.key,
    required this.users,
  });

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: users.length,
      separatorBuilder: (context, index) => const Divider(
        color: Colors.grey,
      ),
      itemBuilder: (context, index) {
        final userName = users[index];
        return PeopleUsersItem(
          user: userName,
        );
      },
    );
  }
}
