import 'package:flutter/material.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/users_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => const UserItems(),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: 10,
    );
  }
}