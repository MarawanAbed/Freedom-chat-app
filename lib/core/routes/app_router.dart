import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/core/di/dependancy_injection.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/features/auth/forget_password/presentation/manager/forget_password_cubit.dart';
import 'package:freedom_chat_app/features/auth/forget_password/presentation/pages/forget_password.dart';
import 'package:freedom_chat_app/features/auth/login/presentation/pages/login_page.dart';
import 'package:freedom_chat_app/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:freedom_chat_app/features/auth/register/presentation/pages/sign_up.dart';
import 'package:freedom_chat_app/features/auth/verify_email/presentation/manager/verify_email_cubit.dart';
import 'package:freedom_chat_app/features/chat/presentation/manager/send_message/send_messages_cubit.dart';
import 'package:freedom_chat_app/features/chat/presentation/pages/chat_page.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/all_users/get_all_user_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/search_users/search_users_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/single_user/get_user_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/update_users/update_user_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/pages/edit_profile.dart';
import 'package:freedom_chat_app/features/home/presentation/pages/home_page.dart';
import 'package:freedom_chat_app/features/home/presentation/pages/search_page.dart';
import 'package:freedom_chat_app/features/onBoarding/presentation/pages/on_boarding_screen.dart';

import '../../features/auth/auth_screen.dart';
import '../../features/auth/login/presentation/manager/login/login_cubit.dart';
import '../../features/auth/verify_email/presentation/pages/verify_email.dart';
import '../../features/home/data/models/user_model.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return _onBoardingScreenRoute();
      case Routes.authScreen:
        return _authScreenRoute();
      case Routes.signInScreen:
        return _signInScreenRoute();
      case Routes.signUpScreen:
        return _signUpScreenRoute();
      case Routes.forgotPasswordScreen:
        return _forgotPasswordScreenRoute();
      case Routes.verifyEmailScreen:
        return _verifyEmailScreenRoute();
      case Routes.homeScreen:
        return _homeScreenRoute();
      case Routes.editProfileScreen:
        final user = settings.arguments as UserModel?;
        return _editProfileScreenRoute(user!);
      case Routes.searchScreen:
        return _searchScreenRoute();
      case Routes.chatScreen:
        final user = settings.arguments as UserModel?;
        return _chatScreenRoute(user!);
      default:
        return _defaultRoute(settings);
    }
  }
}

Route _onBoardingScreenRoute() {
  return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
}

Route _authScreenRoute() {
  return MaterialPageRoute(builder: (_) => const AuthScreen());
}

Route _signInScreenRoute() {
  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: const LoginPage(),
    ),
  );
}

Route _signUpScreenRoute() {
  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (BuildContext context) => getIt<RegisterCubit>(),
      child: const SignUp(),
    ),
  );
}

Route _forgotPasswordScreenRoute() {
  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (BuildContext context) => getIt<ForgetPasswordCubit>(),
      child: const ForgetPassword(),
    ),
  );
}

Route _verifyEmailScreenRoute() {
  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (BuildContext context) => getIt<VerifyEmailCubit>(),
      child: const VerifyEmail(),
    ),
  );
}

Route _homeScreenRoute() {
  return MaterialPageRoute(
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => getIt<GetUserCubit>(),
        ),
        BlocProvider(
          create: (BuildContext context) => getIt<GetAllUserCubit>(),
        ),
        BlocProvider(
          create: (BuildContext context) => getIt<UpdateUserCubit>(),
        ),
      ],
      child: const HomeScreen(),
    ),
  );
}

Route _editProfileScreenRoute(UserModel user) {
  return MaterialPageRoute(
    builder: (_) => EditProfile(user: user),
  );
}

Route _searchScreenRoute() {
  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (BuildContext context) => getIt<SearchUsersCubit>(),
      child: const SearchScreen(),
    ),
  );
}

Route _chatScreenRoute(UserModel user) {
  return MaterialPageRoute(
      builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<SendMessagesCubit>(),
              ),
            ],
            child: ChatScreen(
              user: user,
            ),
          ));
}

Route _defaultRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      body: Center(
        child: Text('No route defined for ${settings.name}'),
      ),
    ),
  );
}
