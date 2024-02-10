import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/search_users/search_users_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/widgets/users_item.dart';

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
                      return UserItems(
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
