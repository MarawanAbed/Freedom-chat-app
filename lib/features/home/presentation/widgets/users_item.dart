import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/custom_profile_image.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserItems extends StatelessWidget {
  const UserItems({
    super.key, required this.user,
  });

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.chatScreen);
      },
      child: ListTile(
        leading: CustomProfileImage(
          imageUrl: user.image!,
        ),
        title:  Text(
          user.name!.toUpperCase(),
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        contentPadding: const EdgeInsets.all(10),
        subtitle: const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Hey there! I am using freedom chat app',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        trailing: Text(
          timeago.format(DateTime.now()),
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
