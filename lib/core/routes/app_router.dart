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
import 'package:freedom_chat_app/features/chat/presentation/pages/chat_page.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/all_users/get_all_user_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/search_users/search_users_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/single_user/get_user_cubit.dart';
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
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.authScreen:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginPage(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => getIt<RegisterCubit>(),
            child: const SignUp(),
          ),
        );
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => getIt<ForgetPasswordCubit>(),
            child: const ForgetPassword(),
          ),
        );
      case Routes.verifyEmailScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => getIt<VerifyEmailCubit>(),
            child: const VerifyEmail(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => getIt<GetUserCubit>(),
              ),
              BlocProvider(
                create: (BuildContext context) => getIt<GetAllUserCubit>(),
              ),
            ],
            child: const HomeScreen(),
          ),
        );
      case Routes.editProfileScreen:
        final user = settings.arguments as UserModel?;
        return MaterialPageRoute(
          builder: (_) => EditProfile(user: user!),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => getIt<SearchUsersCubit>(),
            child: const SearchScreen(),
          ),
        );
      case Routes.chatScreen:
        final user = settings.arguments as UserModel?;
        return MaterialPageRoute(
            builder: (_) => ChatScreen(
                  user: user!,
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
