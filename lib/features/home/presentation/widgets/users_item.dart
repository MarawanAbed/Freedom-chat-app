import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/core/themes/styles.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/custom_profile_image.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserItems extends StatelessWidget {
  const UserItems({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.chatScreen, arguments: user);
        },
        child: ListTile(
          leading: CustomProfileImage(
            user: user,
          ),
          title: Text(
            user.name!,
            style: TextStyles.font18Normal,
          ),
          contentPadding: EdgeInsets.all(AppSizes.kDefaultAllPaddingS10),
          subtitle: Padding(
            padding: EdgeInsets.only(top: AppSizes.kDefaultAllPaddingS10),
            child: Text(
              user.description!,
              style: TextStyles.font14NormalGrey,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          trailing: Text(
            timeago.format(user.lastActive!),
            style: TextStyles.font14Normal,
          ),
        ),
      ),
    );
  }
}
