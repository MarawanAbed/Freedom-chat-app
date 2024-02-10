import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/extension.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
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
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            'Chats',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.searchScreen);
            },
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
          HelperMethod.horizontalSpace(15),
          IconButton(
            onPressed: () {
              var cubit = GetAllUserCubit.get(context);
              cubit.logOutMethod();
              context.pop();
            },
            icon: const Icon(
              Icons.logout,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
