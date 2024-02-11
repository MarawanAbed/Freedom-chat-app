import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
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
            HelperMethod.showSuccessToast(AppStrings.messageSent,gravity: ToastGravity.BOTTOM);
          },
          error: (message) {
            HelperMethod.showErrorToast(message,gravity: ToastGravity.BOTTOM);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
