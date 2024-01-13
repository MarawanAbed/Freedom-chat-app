import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freedom_chat_app/core/services/firebase_serivces.dart';
import 'package:freedom_chat_app/core/utils/app_secured.dart';
import 'package:freedom_chat_app/features/auth/login/data/data_sources/remote_data_source.dart';
import 'package:freedom_chat_app/features/auth/login/data/repositories/login_repo_impl.dart';
import 'package:freedom_chat_app/features/auth/login/domain/repositories/login_repo.dart';
import 'package:freedom_chat_app/features/auth/login/domain/use_cases/github_sign_in.dart';
import 'package:freedom_chat_app/features/auth/login/domain/use_cases/google_sign_in.dart';
import 'package:freedom_chat_app/features/auth/login/domain/use_cases/sign_in.dart';
import 'package:freedom_chat_app/features/auth/register/data/data_sources/remote_data_source.dart';
import 'package:freedom_chat_app/features/auth/register/data/repositories/register_repo_imp.dart';
import 'package:freedom_chat_app/features/auth/register/domain/repositories/register_repo.dart';
import 'package:freedom_chat_app/features/auth/register/domain/use_cases/create_user.dart';
import 'package:freedom_chat_app/features/auth/register/domain/use_cases/register.dart';
import 'package:freedom_chat_app/features/auth/register/domain/use_cases/upload_image.dart';
import 'package:freedom_chat_app/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../features/auth/login/domain/use_cases/twitter_sign_in.dart';
import '../../features/auth/login/presentation/manager/login/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //data sources
  getIt.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImpl(
            auth: getIt(),
            storage: getIt(),
            databaseService: getIt(),
          ));

  //repositories
  getIt.registerLazySingleton<LoginInRepo>(() => LoginRepoImpl(getIt()));
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepoImpl(getIt()));

  //use cases
  getIt.registerLazySingleton<SignInUseCase>(() => SignInUseCase(getIt()));
  getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(getIt()));
  getIt.registerLazySingleton<UploadImageUseCase>(
      () => UploadImageUseCase(getIt()));
  getIt.registerLazySingleton<GoogleSignInUseCase>(
      () => GoogleSignInUseCase(getIt()));
  getIt.registerLazySingleton<GitHubSignInUseCase>(
      () => GitHubSignInUseCase(getIt()));
  getIt.registerLazySingleton<TwitterSignInUseCase>(
      () => TwitterSignInUseCase(getIt()));
  getIt.registerLazySingleton<CreateUserUseCase>(() => CreateUserUseCase(getIt()));
  //cubit
  getIt.registerLazySingleton<LoginCubit>(
    () => LoginCubit(
      twitterSignInUseCase: getIt(),
      googleSignInUseCase: getIt(),
      signInUseCase: getIt(),
      gitHubSignInUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(
        registerUseCase: getIt(),
        uploadImageUseCase: getIt(),
        createUserUseCase: getIt(),
      ));

  //services
  getIt.registerLazySingleton<AuthService>(() => AuthService(
        googleSignIn: getIt(),
        auth: getIt(),
        gitHubSignIn: getIt(),
        twitterLogin: getIt(),
      ));
  getIt.registerLazySingleton<StorageService>(() => StorageService(
        getIt(),
      ));
  getIt.registerLazySingleton<DatabaseService>(() => DatabaseService(
    getIt(),
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
      apiSecretKey: AppSecured.twitterApiSecretKey,
      redirectURI: 'flutter-twitter-practice://');
  final storage = FirebaseStorage.instance;
  final fireStore=FirebaseFirestore.instance;

  getIt.registerLazySingleton(() => auth);
  getIt.registerLazySingleton(() => fireStore);
  getIt.registerLazySingleton(() => storage);
  getIt.registerLazySingleton(() => googleSignIn);
  getIt.registerLazySingleton(() => gitHubSignIn);
  getIt.registerLazySingleton(() => twitterLogin);
}
