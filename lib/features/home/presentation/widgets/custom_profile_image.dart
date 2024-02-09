import 'package:flutter/material.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 25,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                user.image!,
                fit: BoxFit.cover,
              )),
        ),
        if (user.isOnline!) Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
        ) else Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
