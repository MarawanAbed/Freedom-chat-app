import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/chat_app.dart';
import 'package:freedom_chat_app/core/di/dependancy_injection.dart';
import 'package:freedom_chat_app/core/services/bloc_observer.dart';
import 'package:freedom_chat_app/core/utils/strings.dart';
import 'package:freedom_chat_app/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes/app_router.dart';
import 'core/services/notification_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupGetIt();
  getIt<RemoteNotificationService>().firebaseNotification();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? onBoarding = prefs.getBool(AppStrings.onBoardingKey) ?? false;
  Bloc.observer = MyBlocObserver();
  await getIt<RemoteNotificationService>()
      .firebaseMessaging
      .getInitialMessage();
  await getIt<LocalNotificationsServices>().init();
  await getIt<RemoteNotificationService>()
      .firebaseMessaging
      .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
  runApp(
    ChatApp(
      onBoarding: onBoarding,
      appRouter: AppRouter(),
    ),
  );
}
