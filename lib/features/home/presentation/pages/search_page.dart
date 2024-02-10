import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AppTextFormField(
              hintText: 'Search',
              onChanged: (value) {
                context.read<SearchUsersCubit>().searchUsers(value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const SearchBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
