import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/home/data/models/user_model.dart';
import 'package:freedom_chat_app/features/home/domain/use_cases/search_users.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_users_state.dart';
part 'search_users_cubit.freezed.dart';

class SearchUsersCubit extends Cubit<SearchUsersState> {
  SearchUsersCubit(this.searchUsersUseCase) : super(const SearchUsersState.initial());

  static SearchUsersCubit get(context) => BlocProvider.of(context);

  final SearchUsersUseCase searchUsersUseCase;


  void searchUsers(String name) {
    final result = searchUsersUseCase(name);
    result.listen((users) {
      emit(SearchUsersState.success(users));
    }, onError: (e) {
      emit(SearchUsersState.error(e.toString()));
    });
  }
}
