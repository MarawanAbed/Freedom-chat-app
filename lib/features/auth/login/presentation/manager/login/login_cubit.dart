import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/core/di/dependancy_injection.dart';
import 'package:freedom_chat_app/core/services/notification_services.dart';
import 'package:freedom_chat_app/features/auth/login/data/models/sign_in_model.dart';
import 'package:freedom_chat_app/features/auth/login/domain/use_cases/github_sign_in.dart';
import 'package:freedom_chat_app/features/auth/login/domain/use_cases/google_sign_in.dart';
import 'package:freedom_chat_app/features/auth/login/domain/use_cases/sign_in.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/use_cases/twitter_sign_in.dart';

part 'login_cubit.freezed.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignInUseCase signInUseCase;
  final GoogleSignInUseCase googleSignInUseCase;
  final GitHubSignInUseCase gitHubSignInUseCase;

  final TwitterSignInUseCase twitterSignInUseCase;

  LoginCubit({
    required this.twitterSignInUseCase,
    required this.signInUseCase,
    required this.googleSignInUseCase,
    required this.gitHubSignInUseCase,
  }) : super(const LoginState.initial());

  static LoginCubit of(BuildContext context) =>
      BlocProvider.of<LoginCubit>(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> loginMethod() async {
    if (formKey.currentState!.validate()) {
      emit(const LoginState.loading());
      try {
        await signInUseCase.call(
          SignInModel(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          ),
        );
        await getIt<RemoteNotificationService>().requestPermission();
        await getIt<RemoteNotificationService>().getToken();
        emit(const LoginState.success());
      } catch (e) {
        emit(LoginState.error(e.toString()));
      }
    }
  }

  void googleSignInMethod() async {
    emit(const LoginState.loading());
    try {
      await googleSignInUseCase.call();
      await getIt<RemoteNotificationService>().requestPermission();
      await getIt<RemoteNotificationService>().getToken();
      emit(const LoginState.success());
    } catch (e) {
      if(e.toString() =='Null check operator used on a null value'){
        emit(const LoginState.error('User cancelled the login'));
      }else {
        emit(LoginState.error(e.toString()));
      }
    }
  }

  void gitHubSignInMethod(context) async {
    try {
      await gitHubSignInUseCase.call(context);
      await getIt<RemoteNotificationService>().requestPermission();
      await getIt<RemoteNotificationService>().getToken();
      emit(const LoginState.successWithGithub());
    } catch (e) {
      if(e.toString() =='Null check operator used on a null value'){
        emit(const LoginState.error('User cancelled the login'));
      }else {
        emit(LoginState.error(e.toString()));
      }
    }
  }

  void twitterSignInMethod() async {
    try {
      emit(const LoginState.loading());
      await twitterSignInUseCase.call();
      await getIt<RemoteNotificationService>().requestPermission();
      await getIt<RemoteNotificationService>().getToken();
      emit(const LoginState.success());
    } catch (e) {
      if(e.toString() =='Null check operator used on a null value'){
        emit(const LoginState.error('User cancelled the login'));
      }else {
        emit(LoginState.error(e.toString()));
      }
    }
  }

  //close cubit
  @override
  void emit(LoginState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
