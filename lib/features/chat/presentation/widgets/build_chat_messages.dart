import 'package:flutter/material.dart';
import 'package:freedom_chat_app/features/chat/data/models/message_model.dart';
import 'package:freedom_chat_app/features/chat/presentation/widgets/message_bubble.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

class BuildChatMessage extends StatelessWidget {
  const BuildChatMessage(
      {super.key, required this.user, required this.messages});

  final UserModel user;
  final List<MessageModel> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        //that isMe is used to check if the message is sent by the user or not
        //is not quality to the user id of the message then it is not sent by the user
        final isMe = messages[index].senderId != user.uId;
        return MessageBubble(
          user: user,
          isMe: isMe,
          messageModel: messages[index],
        );
      },
      itemCount: messages.length,
    );
  }
}
