import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/custom_profile_image.dart';

class PeopleUsersItem extends StatelessWidget {
  final String name;

  const PeopleUsersItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.chatScreen);
      },
      child: ListTile(
        contentPadding: const EdgeInsets.all(20),
        leading: const CustomProfileImage(),
        title: const Text('ahmed'),
        subtitle: const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'description',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
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