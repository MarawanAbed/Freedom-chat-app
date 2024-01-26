import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/custom_profile_image.dart';

class PeopleUsersItem extends StatelessWidget {
  final UserModel user;

  const PeopleUsersItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.chatScreen);
      },
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading:  CustomProfileImage(
          imageUrl: user.image!,
        ),
        title:Text (user.name!),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            user.description!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
        onTap: () {
          // Handle user item tap if needed
        },
      ),
    );
  }
}