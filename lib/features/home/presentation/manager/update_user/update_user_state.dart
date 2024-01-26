part of 'update_user_cubit.dart';

@freezed
class UpdateUserState with _$UpdateUserState {
  const factory UpdateUserState.initial() = _Initial;

  const factory UpdateUserState.loading() = Loading;

  const factory UpdateUserState.success() = Success;

  const factory UpdateUserState.error(String message) = Error;

  const factory UpdateUserState.uploadImageErrorState(String message) = UploadImageErrorState;

  const factory UpdateUserState.updateEmailAndPasswordErrorState(String message) = UpdateEmailAndPasswordErrorState;

  const factory UpdateUserState.updateEmailAndPasswordSuccessState() = UpdateEmailAndPasswordSuccessState;
}
