import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/chat/presentation/manager/get_all_messages/get_all_messages_cubit.dart';
import 'package:freedom_chat_app/features/chat/presentation/widgets/build_chat_messages.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

class ChatMessage extends StatefulWidget {
  const ChatMessage({super.key, required this.user});

  final UserModel user;

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  void initState() {
    var cubit = GetAllMessagesCubit.get(context);
    cubit.getAllMessage(receiverId: widget.user.uId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllMessagesCubit, GetAllMessagesState>(
        buildWhen: (previous, current) =>
            current is Loaded || current is Error || current is Loading,
        builder: (context, state) {
          return state.when(initial: () {
            return const Center(child: CircularProgressIndicator());
          }, loading: () {
            return const Center(child: CircularProgressIndicator());
          }, loaded: (messages) {
            return BuildChatMessage(
              user: widget.user,
              messages: messages,
            );
          }, error: (message) {
            return Center(child: Text(message));
          });
        });
  }
  @override
  void dispose() {
    var cubit = GetAllMessagesCubit.get(context);
    cubit.clearMessages();
    cubit.close();
    super.dispose();
  }
}
