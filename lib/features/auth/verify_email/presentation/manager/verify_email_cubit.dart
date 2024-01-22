import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/features/auth/verify_email/domain/use_cases/check_verify_email.dart';
import 'package:freedom_chat_app/features/auth/verify_email/domain/use_cases/log_out.dart';
import 'package:freedom_chat_app/features/auth/verify_email/domain/use_cases/resend_email.dart';
import 'package:freedom_chat_app/features/auth/verify_email/domain/use_cases/verify_email.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_cubit.freezed.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit(
      {required this.verifyEmail,
      required this.logOut,
      required this.resendVerifyEmail,
      required this.checkVerifyEmail})
      : super(const VerifyEmailState.initial());

  static VerifyEmailCubit get(context) => BlocProvider.of(context);
  final VerifyEmailUseCase verifyEmail;
  final CheckVerifyEmailUseCase checkVerifyEmail;
  final ResendVerifyEmailUseCase resendVerifyEmail;
  final LogOutUseCase logOut;
  bool canSendEmail = false;
  Timer? _timer;

  Future<void> sendVerificationEmail() async {
    try {
      await verifyEmail.call();
      canSendEmail=false;
      await Future.delayed(const Duration(seconds: 3));
      canSendEmail=true;
     emit(const VerifyEmailState.verificationEmailSentState());
    } catch (e) {
      emit(VerifyEmailState.verificationErrorState(e.toString()));
    }
  }

  void startEmailVerificationCheckTimer() {
    _timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  void checkEmailVerified() async {
    final isVerified = await checkVerifyEmail.call();
    if (isVerified) {
      emit(const VerifyEmailState.verificationSuccessState());
      _timer?.cancel();
    }
  }

  void logOutMethod() async {
    try {
      await logOut.call();
    } catch (e) {
      emit(VerifyEmailState.verificationErrorState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  @override
  void emit(VerifyEmailState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
