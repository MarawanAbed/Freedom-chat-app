import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
    this.onTap,
    required this.currentIndex,
  });

  final int currentIndex;

  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.chat_bubble_fill,
          ),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'profile',
        ),
      ],
    );
  }
}
