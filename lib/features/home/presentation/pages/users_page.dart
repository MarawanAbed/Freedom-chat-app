import 'package:flutter/material.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/people_users_item.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final List<String> users = [
    'User 1',
    'User 2',
    'User 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final userName = users[index];
          return PeopleUsersItem(
            name: userName,
          );
        },
      ),
    );
  }
}
