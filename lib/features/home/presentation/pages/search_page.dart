import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/core/helpers/helper_methods.dart';
import 'package:freedom_chat_app/core/utils/sizes.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
import 'package:freedom_chat_app/core/widgets/app_text_form.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/search_users/search_users_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/search_bloc_builder.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.searchUsers),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.kDefaultAllPaddingS20),
        child: Column(
          children: [
            AppTextFormField(
              hintText: AppStrings.searchUsers,
              onChanged: (value) {
                context.read<SearchUsersCubit>().searchUsers(value);
              },
            ),
            HelperMethod.verticalSpace(AppSizes.verticalSpacingS20),
            const SearchBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
