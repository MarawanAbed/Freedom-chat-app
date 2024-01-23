import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';

class BuildRowInfo extends StatelessWidget {
  final UserModel user;

  const BuildRowInfo({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Id:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user.uId!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        HelperMethod.verticalSpace(20),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        HelperMethod.verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Email:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user.email!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        HelperMethod.verticalSpace(20),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        HelperMethod.verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Description:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user.description!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        HelperMethod.verticalSpace(20),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        HelperMethod.verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Password:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user.password!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
