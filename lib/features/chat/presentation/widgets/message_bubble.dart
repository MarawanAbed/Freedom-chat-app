import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key, required this.user,
    // required this.messageModel,
    // required this.isMe,
  });

  final UserModel user;
  // final bool isMe;

  @override
  Widget build(BuildContext context) {
    // final isImageMessage = messageModel.chatContent.startsWith('http'); // Check if the content is a URL

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  user.image!,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Ahmed Karim',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
