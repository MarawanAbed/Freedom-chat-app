part of 'search_users_cubit.dart';

@freezed
class SearchUsersState with _$SearchUsersState {
  const factory SearchUsersState.initial() = _Initial;

  const factory SearchUsersState.success(List<UserModel> users) = Success;

  const factory SearchUsersState.error(String message) = Error;
}
