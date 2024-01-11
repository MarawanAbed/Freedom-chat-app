part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success() = Success;
  const factory LoginState.successWithGithub() = SuccessWithGithub;
  const factory LoginState.error(String error) = Error;

  const factory LoginState.errorWithGithub(String error) = ErrorWithGithub;
}
