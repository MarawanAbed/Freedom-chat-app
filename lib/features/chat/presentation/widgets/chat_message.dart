import 'package:flutter/material.dart';
import 'package:freedom_chat_app/features/chat/presentation/widgets/message_bubble.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

class ChatMessage extends StatefulWidget {
  const ChatMessage({super.key, required this.user});

  final UserModel user;
  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        // final message = cubit.message[index];
        //check if the message is sent by me or not
        //equal to the receiver id then its sent by me
        //else its sent by the other user
        // final isMe = message.chatSenderId != widget.receiverId;
        return MessageBubble(
          user: widget.user,
          // isMe: isMe,
          // messageModel: cubit.message[index],
        );
      },
      itemCount: 10,
    );
  }
}
