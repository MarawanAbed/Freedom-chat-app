import 'package:flutter/material.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/people_users_item.dart';

import '../../data/models/user_model.dart';

class BuildPeopleItems extends StatelessWidget {
  const BuildPeopleItems({
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
