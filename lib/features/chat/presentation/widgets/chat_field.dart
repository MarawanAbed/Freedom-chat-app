import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
import 'package:freedom_chat_app/core/widgets/app_text_form.dart';
import 'package:freedom_chat_app/features/chat/presentation/manager/send_message/send_messages_cubit.dart';
import 'package:freedom_chat_app/features/chat/presentation/widgets/chat_text_field_bloc_listener.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

import '../../../../core/themes/styles.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key, required this.user});

  final UserModel user;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.kDefaultSymmetricHorizontalPaddingS10),
      child: Row(
        children: [
          Expanded(
            child: AppTextFormField(
              controller: _controller,
              inputTextStyle: _inputColor(theme),
              hintStyle: _hintStyle(theme),
              backgroundColor: theme ? AppColors.kField2 : Colors.white,
              hintText: AppStrings.typeMessage,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      _sendImage(context);
                    },
                    icon: Icon(
                      Icons.camera_alt,
                      size: AppSizes.iconSizeS20,
                      color: theme ? Colors.white : Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _sendText(context);
                    },
                    icon: Icon(
                      Icons.send,
                      size: AppSizes.iconSizeS20,
                      color: theme ? Colors.white : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const ChatTextFieldBlocListener(),
        ],
      ),
    );
  }

  TextStyle _hintStyle(bool theme) {
    return theme
        ? TextStyles.font14NormalGrey.copyWith(color: Colors.white)
        : TextStyles.font14NormalGrey;
  }

  TextStyle _inputColor(bool theme) {
    return theme
        ? TextStyles.font14NormalGrey.copyWith(color: Colors.white)
        : TextStyles.font14NormalGrey.copyWith(color: Colors.black);
  }

  Future<void> _sendText(BuildContext context) async {
    var cubit = SendMessagesCubit.get(context);
    await cubit.addMessageText(
        content: _controller.text, receiverId: widget.user.uId!,user: widget.user);
    _controller.clear();
  }

  Future<void> _sendImage(BuildContext context) async {
    var cubit = SendMessagesCubit.get(context);
    await cubit.addMessageImage(receiverId: widget.user.uId!,user: widget.user);
  }
}
