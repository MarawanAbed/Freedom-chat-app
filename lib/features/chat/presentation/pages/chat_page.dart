import 'package:flutter/material.dart';
import 'package:freedom_chat_app/features/chat/presentation/widgets/chat_appbar.dart';
import 'package:freedom_chat_app/features/chat/presentation/widgets/chat_field.dart';
import 'package:freedom_chat_app/features/chat/presentation/widgets/chat_message.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(
        user: user,
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatMessage(
              user: user,
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ChatTextField(user: user),
        ],
      ),
    );
  }
}
