import 'package:flutter/material.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/custom_profile_image.dart';

class PeopleUsersItem extends StatelessWidget {
  final UserModel user;

  const PeopleUsersItem({super.key, required this.user, this.isMe = false});

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      leading: CustomProfileImage(
        user: user,
      ),
      title: isMe ? const Text('Me') : Text(user.name!),
      subtitle: const Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Text(
          'Hey there! I am using freedom chat app',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
