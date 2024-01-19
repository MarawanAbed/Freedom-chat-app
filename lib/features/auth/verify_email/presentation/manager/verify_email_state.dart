part of 'verify_email_cubit.dart';

@freezed
class VerifyEmailState with _$VerifyEmailState {
  const factory VerifyEmailState.initial() = _Initial;

  const factory VerifyEmailState.verificationEmailSentState() = VerificationEmailSentState;

  const factory VerifyEmailState.verificationSuccessState()= VerificationSuccessState;

  const factory VerifyEmailState.verificationErrorState(String message) = VerificationErrorState;

}
