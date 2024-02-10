import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/core/di/dependancy_injection.dart';
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
  final ScrollController _scrollController = ScrollController();

  late GetAllMessagesCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = GetAllMessagesCubit(getIt(),);
    _cubit.getAllMessage(receiverId: widget.user.uId!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<GetAllMessagesCubit, GetAllMessagesState>(
          buildWhen: (previous, current) =>
          current is Loaded || current is Error || current is Loading,
          builder: (context, state) {
            return state.when(initial: () {
              return const Center(child: CircularProgressIndicator());
            }, loading: () {
              return const Center(child: CircularProgressIndicator());
            }, loaded: (messages) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              });
              return BuildChatMessage(
                scrollController: _scrollController,
                user: widget.user,
                messages: messages,
              );
            }, error: (message) {
              return Center(child: Text(message));
            });
          }),
    );
  }
  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
