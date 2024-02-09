import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/all_users/get_all_user_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/users_item.dart';

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

class BuildUserItem extends StatelessWidget {
  const BuildUserItem({super.key, required this.users});

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => users.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('No Chats Yet', textAlign: TextAlign.center),
            )
          : UserItems(
              user: users[index],
            ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: users.isEmpty ? 1 : users.length,
    );
  }
}
