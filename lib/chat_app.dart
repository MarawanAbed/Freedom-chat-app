import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freedom_chat_app/core/di/dependancy_injection.dart';
import 'package:freedom_chat_app/core/routes/app_router.dart';
import 'package:freedom_chat_app/core/routes/routes.dart';
import 'package:freedom_chat_app/core/services/firebase_serivces.dart';
import 'package:freedom_chat_app/core/themes/themes.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';

class ChatApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool onBoarding;

  const ChatApp({super.key, required this.appRouter, required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: StreamBuilder<User?>(
        stream: getIt<AuthService>().userState(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final user = snapshot.data;
            if (user != null && user.emailVerified) {
              return HomeScreen(
                appRouter: appRouter,
              );
            } else {
              return VerifyEmailScreen(
                appRouter: appRouter,
              );
            }
          } else {
            return onBoarding
                ? AuthScreen(
                    appRouter: appRouter,
                  )
                : OnBoardingScreen(
                    appRouter: appRouter,
                  );
          }
        },
      ),
    );
  }
}

class BaseScreen extends StatelessWidget {
  final AppRouter appRouter;
  final String initialRoute;

  const BaseScreen({
    Key? key,
    required this.appRouter,
    required this.initialRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.titleApp,
      theme: Themes.lightThemeData(context),
      darkTheme: Themes.darkThemeData(context),
      themeMode: ThemeMode.system,
      initialRoute: initialRoute,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

class HomeScreen extends BaseScreen {
  const HomeScreen({Key? key, required AppRouter appRouter})
      : super(key: key, appRouter: appRouter, initialRoute: Routes.homeScreen);
}

class VerifyEmailScreen extends BaseScreen {
  const VerifyEmailScreen({Key? key, required AppRouter appRouter})
      : super(
            key: key,
            appRouter: appRouter,
            initialRoute: Routes.verifyEmailScreen);
}

class AuthScreen extends BaseScreen {
  const AuthScreen({Key? key, required AppRouter appRouter})
      : super(key: key, appRouter: appRouter, initialRoute: Routes.authScreen);
}

class OnBoardingScreen extends BaseScreen {
  const OnBoardingScreen({Key? key, required AppRouter appRouter})
      : super(
            key: key,
            appRouter: appRouter,
            initialRoute: Routes.onBoardingScreen);
}
