import 'package:flutter/material.dart';
import 'package:freedom_chat_app/features/home/presentation/pages/profile_page.dart';
import 'package:freedom_chat_app/features/home/presentation/pages/users_page.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/bottom_navigation.dart';

import '../widgets/home_app_bar.dart';
import '../widgets/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeBody(),
    UsersScreen(),
    ProfileScreen(),
  ];
  final List<String> _titles = const [
    'Home',
    'Users',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titles[_currentIndex] == 'Home'
          ? const HomeAppBar() as PreferredSizeWidget
          : AppBarCustom(
              title: _titles[_currentIndex],
            ),
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
