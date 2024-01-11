import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/assets/generated/assets.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key, this.onTap,required this.currentIndex,
  });

  final int currentIndex ;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.chat_bubble_fill,
          ),
          label: 'Chats',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'People',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 15,
            child: Image.asset(Assets.imagesUser),
          ),
          label: 'profile',
        ),
      ],
    );
  }
}
