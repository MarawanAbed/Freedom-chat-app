import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freedom_chat_app/chat_app.dart';
import 'package:freedom_chat_app/core/di/dependancy_injection.dart';
import 'package:freedom_chat_app/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedom_chat_app/core/services/bloc_observer.dart';
import 'core/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupGetIt();
  runApp(
    ChatApp(
      appRouter: AppRouter(),
    ),
  );
}
