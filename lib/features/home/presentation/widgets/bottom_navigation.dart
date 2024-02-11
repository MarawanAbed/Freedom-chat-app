import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';

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
          label: AppStrings.chats,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: AppStrings.profile,
        ),
      ],
    );
  }
}
