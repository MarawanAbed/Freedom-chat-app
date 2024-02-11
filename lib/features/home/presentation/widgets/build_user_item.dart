import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/users_item.dart';

class BuildUserItem extends StatelessWidget {
  const BuildUserItem({super.key, required this.users});

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => users.isEmpty
          ?  Padding(
              padding: EdgeInsets.all(AppSizes.kDefaultAllPaddingS16),
              child: const Text(AppStrings.noChatsYet, textAlign: TextAlign.center),
            )
          : UserItems(
              user: users[index],
            ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: users.isEmpty ? 1 : users.length,
    );
  }
}
