import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/custom_profile_image.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserItems extends StatelessWidget {
  const UserItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.chatScreen);
      },
      child: ListTile(
        leading: const CustomProfileImage(),
        title: const Text(
          'Ahmed',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        contentPadding: const EdgeInsets.all(10),
        subtitle: const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Hello',
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