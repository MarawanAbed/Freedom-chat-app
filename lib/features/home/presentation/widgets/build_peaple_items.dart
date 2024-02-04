import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/di/dependancy_injection.dart';
import 'package:freedom_chat_app/core/services/firebase_serivces.dart';
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
        // i make this to check if the user is me or not to show the right icon
        final isMe = users[index].uId == getIt<AuthService>().auth.currentUser!.uid;
        final userName = users[index];
        return PeopleUsersItem(
          user: userName,
          isMe: isMe,
        );
      },
    );
  }
}
