import 'package:firebase_auth/firebase_auth.dart';
import 'package:freedom_chat_app/core/services/firebase_serivces.dart';
import 'package:freedom_chat_app/core/utils/app_secured.dart';
import 'package:freedom_chat_app/features/auth/login/data/data_sources/remote_data_source.dart';
import 'package:freedom_chat_app/features/auth/login/data/repositories/auth_repo_impl.dart';
import 'package:freedom_chat_app/features/auth/login/domain/repositories/auth_repo.dart';
import 'package:freedom_chat_app/features/auth/login/domain/use_cases/github_sign_in.dart';
import 'package:freedom_chat_app/features/auth/login/domain/use_cases/google_sign_in.dart';
import 'package:freedom_chat_app/features/auth/login/domain/use_cases/sign_in.dart';
import 'package:get_it/get_it.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';
import '../../features/auth/login/domain/use_cases/twitter_sign_in.dart';
import '../../features/auth/login/presentation/manager/login/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(getIt()));

  //repositories
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));

  //use cases
  getIt.registerLazySingleton<SignInUseCase>(() => SignInUseCase(getIt()));
  getIt.registerLazySingleton<GoogleSignInUseCase>(
      () => GoogleSignInUseCase(getIt()));
  getIt.registerLazySingleton<GitHubSignInUseCase>(
      () => GitHubSignInUseCase(getIt()));
  getIt.registerLazySingleton<TwitterSignInUseCase>(
      () => TwitterSignInUseCase(getIt()));
  //cubit
  getIt.registerLazySingleton<LoginCubit>(
    () => LoginCubit(
      twitterSignInUseCase: getIt(),
      googleSignInUseCase: getIt(),
      signInUseCase: getIt(),
      gitHubSignInUseCase: getIt(),
    ),
  );

  //services
  getIt.registerLazySingleton<AuthService>(() => AuthService(
        googleSignIn: getIt(),
        auth: getIt(),
        gitHubSignIn: getIt(),
        twitterLogin: getIt(),
      ));

  //external
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  final GitHubSignIn gitHubSignIn = GitHubSignIn(
    clientId: AppSecured.gitHubClientId,
    clientSecret: AppSecured.gitHubClientSecret,
    redirectUrl: AppSecured.gitHubRedirectUrl,
  );
  final twitterLogin = TwitterLogin(
      apiKey: AppSecured.twitterApiKey,
      apiSecretKey:AppSecured.twitterApiSecretKey,
      redirectURI: 'flutter-twitter-practice://'
  );

  getIt.registerLazySingleton(() => auth);
  getIt.registerLazySingleton(() => googleSignIn);
  getIt.registerLazySingleton(() => gitHubSignIn);
  getIt.registerLazySingleton(() => twitterLogin);
}
