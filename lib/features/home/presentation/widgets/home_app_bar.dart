import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/core/themes/styles.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/all_users/get_all_user_cubit.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

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
          padding: EdgeInsets.only(left: AppSizes.kDefaultAllPaddingS10),
          child:  Text(
            'Chats',
            style: TextStyles.font22Bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.searchScreen);
            },
            icon:  Icon(
              Icons.search,
              size: AppSizes.iconSizeS30,
            ),
          ),
          HelperMethod.horizontalSpace(AppSizes.horizontalSpacingS15),
          IconButton(
            onPressed: () {
              var cubit = GetAllUserCubit.get(context);
              cubit.logOutMethod();
              context.pop();
            },
            icon: Icon(
              Icons.logout,
              size: AppSizes.iconSizeS30,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
