import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    // required this.messageModel,
    // required this.isMe,
  });

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
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
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
