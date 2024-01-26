part of 'get_user_cubit.dart';

@freezed
class GetUserState with _$GetUserState {
  const factory GetUserState.initial() = _Initial;

  const factory GetUserState.loading() = Loading;

  const factory GetUserState.success() = Success;

  const factory GetUserState.error(String message) = Error;
}
