import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/themes/styles.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: AppSizes.circleAvatarRadius,
                backgroundImage: NetworkImage(user.image!),
              ),
              if (user.isOnline!)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: AppSizes.userStateSizeWidth,
                    height: AppSizes.userStateSizeHeight,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: AppSizes.stateBorderWidth,
                      ),
                    ),
                  ),
                )
              else
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: AppSizes.userStateSizeWidth,
                    height: AppSizes.userStateSizeHeight,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: AppSizes.stateBorderWidth,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          HelperMethod.horizontalSpace(AppSizes.horizontalSpacingS10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  user.name!,
                  style: TextStyles.font18Bold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${AppStrings.active} ${timeago.format(user.lastActive!)}',
                style:
                    TextStyles.font12NormalGrey.copyWith(color: Colors.white54),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
