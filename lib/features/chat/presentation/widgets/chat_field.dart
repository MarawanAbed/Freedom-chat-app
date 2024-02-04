import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';
import 'package:freedom_chat_app/core/widgets/app_text_form.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key});

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
           Expanded(
            child: AppTextFormField(
              controller: _controller,
              hintText: 'Type a message',
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {},
            backgroundColor: AppColors.kPrimaryColor,
            child: const Icon(Icons.send),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: "btn2",
            backgroundColor: AppColors.kSecondaryColor,
            onPressed: () {},
            child: const Icon(Icons.camera_alt_outlined),
          ),
        ],
      ),
    );
  }
}
