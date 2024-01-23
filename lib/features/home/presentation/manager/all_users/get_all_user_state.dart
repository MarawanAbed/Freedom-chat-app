part of 'get_all_user_cubit.dart';

@freezed
class GetAllUserState with _$GetAllUserState {
  const factory GetAllUserState.initial() = _Initial;

  const factory GetAllUserState.loading() = Loading;

  const factory GetAllUserState.success(List<UserModel> users) = Success;

  const factory GetAllUserState.error(String message) = Error;
}
