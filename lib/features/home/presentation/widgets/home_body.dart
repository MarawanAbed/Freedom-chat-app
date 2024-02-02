import 'package:flutter/material.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/users_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const BuildUserItem(users: []);
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
