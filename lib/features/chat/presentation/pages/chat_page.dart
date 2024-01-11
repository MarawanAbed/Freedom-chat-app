import 'package:flutter/material.dart';
import 'package:freedom_chat_app/features/chat/presentation/widgets/chat_appbar.dart';
import 'package:freedom_chat_app/features/chat/presentation/widgets/chat_field.dart';
import 'package:freedom_chat_app/features/chat/presentation/widgets/chat_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChatAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ChatMessage(),
          ),
          Divider(),
          ChatTextField(),
        ],
      ),
    );
  }
}
