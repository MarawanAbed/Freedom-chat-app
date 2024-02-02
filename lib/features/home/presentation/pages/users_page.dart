import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/all_users/get_all_user_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/people_users_item.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    var cubit = GetAllUserCubit.get(context);
    cubit.getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetAllUserCubit, GetAllUserState>(
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
            success: (users) =>
                BuildPeople(users: users),
            error: (message) => Center(
              child: Text(message),
            ),
          );
        },
      ),
    );
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
