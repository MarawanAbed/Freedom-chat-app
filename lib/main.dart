import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freedom_chat_app/chat_app.dart';
import 'package:freedom_chat_app/core/di/dependancy_injection.dart';
import 'package:freedom_chat_app/core/utils/constants.dart';
import 'package:freedom_chat_app/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/core/services/bloc_observer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/routes/app_router.dart';
import 'core/services/notification_services.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
final RemoteNotificationService remoteNotificationService = RemoteNotificationService();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs =await SharedPreferences.getInstance();
  bool? onBoarding = prefs.getBool(onBoardingKey)??false;
  Bloc.observer = MyBlocObserver();
  await FirebaseMessaging.instance.getInitialMessage();
  await LocalNotificationsServices.init(flutterLocalNotificationsPlugin);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  remoteNotificationService.firebaseNotification();
  await setupGetIt();
  runApp(
    ChatApp(
      onBoarding: onBoarding,
      appRouter: AppRouter(),
    ),
  );
}
