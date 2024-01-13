part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;

  const factory RegisterState.loading() = Loading;
  const factory RegisterState.success() = Success;
  const factory RegisterState.error(String message) = Error;
  const factory RegisterState.uploadImageLoadingState() = UploadImageLoadingState;
  const factory RegisterState.uploadImageSuccessState() = UploadImageSuccessState;
  const factory RegisterState.uploadImageErrorState(String message) = UploadImageErrorState;
}
