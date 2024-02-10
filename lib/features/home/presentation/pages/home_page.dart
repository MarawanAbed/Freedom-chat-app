import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/home/presentation/pages/profile_page.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/bottom_navigation.dart';

import '../manager/update_users/update_user_cubit.dart';
import '../widgets/app_bar_custom.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomeBody(),
    ProfileScreen(),
  ];
  final List<String> _titles = const [
    'Home',
    'Profile',
  ];

  @override
  void initState() {
    context.read<UpdateUserCubit>().updateUserMethod({
      'lastActive': DateTime.now(),
      'isOnline': true,
    });
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    var cubit = UpdateUserCubit.get(context);
    if (state == AppLifecycleState.resumed) {
      cubit.updateUserMethod({
        'lastActive': DateTime.now(),
        'isOnline': true,
      });
    } else {
      cubit.updateUserMethod({
        'isOnline': false,
      });
    }
  }

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
