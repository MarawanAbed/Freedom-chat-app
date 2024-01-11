import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/assets/generated/assets.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget{
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title:  Row(
        children: [
           const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(Assets.imagesUser),
          ),
          HelperMethod.horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ahmed Karim',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Active ${timeago.format(DateTime.now())}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
