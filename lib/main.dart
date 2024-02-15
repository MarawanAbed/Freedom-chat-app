import 'package:freedom_chat_app/chat_app.dart';
import 'package:freedom_chat_app/lib_imports.dart';

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
