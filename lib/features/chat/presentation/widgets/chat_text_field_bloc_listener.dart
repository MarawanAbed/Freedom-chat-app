import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/chat/presentation/manager/send_message/send_messages_cubit.dart';

class ChatTextFieldBlocListener extends StatelessWidget {
  const ChatTextFieldBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendMessagesCubit, SendMessagesState>(
      listenWhen: (previous, current) =>
          current is Loaded || current is Error || current is Loading,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            const Center(child: CircularProgressIndicator());
          },
          loaded: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Message Sent'),
                backgroundColor: Colors.green,
              ),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
