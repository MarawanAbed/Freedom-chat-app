import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/core/widgets/app_text_form.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/search_users/search_users_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/people_users_item.dart';

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

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchUsersCubit, SearchUsersState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(
            child: CircularProgressIndicator(),
          ),
          success: (users) => users.isEmpty
              ? const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, size: 100, color: Colors.grey),
                      Text('Not Found'),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return PeopleUsersItem(
                        user: users[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: users.length,
                  ),
                ),
          error: (message) => Center(
            child: Text(message),
          ),
        );
      },
    );
  }
}
