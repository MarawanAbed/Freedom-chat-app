import 'package:freedom_chat_app/features/auth/login/presentation/manager/login/login_cubit.dart';
import 'package:freedom_chat_app/features/chat/presentation/manager/send_message/send_messages_cubit.dart';
import 'package:freedom_chat_app/features/home/presentation/manager/single_user/get_user_cubit.dart';
import 'package:freedom_chat_app/lib_imports.dart';
import '../../features/auth/register/presentation/manager/register_cubit.dart';
import '../../features/chat/presentation/manager/get_all_messages/get_all_messages_cubit.dart';
import '../../features/home/presentation/manager/all_users/get_all_user_cubit.dart';
import '../../features/home/presentation/manager/search_users/search_users_cubit.dart';
import '../../features/home/presentation/manager/update_users/update_user_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  try
  {
    _setupDataSources();
    _setupRepositories();
    _setupUseCases();
    _setupCubits();
    _setupServices();
    _setupExternal();
  }catch(e)
  {
    print('Failed to initialize dependencies: $e');
  }
}

void _setupDataSources() {
  //data sources
  getIt.registerLazySingleton<HomeRemoteDataSource>(
          () => HomeRemoteDataSourceImpl(
        databaseService: getIt(),
        storeService: getIt(),
        authService: getIt(),
      ));
  getIt.registerLazySingleton<LoginRemoteDataSource>(
          () => LoginRemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<VerifyEmailRemoteDataSource>(
          () => VerifyEmailRemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<RegisterRemoteDataSource>(
          () => RegisterRemoteDataSourceImpl(
        auth: getIt(),
        storage: getIt(),
        databaseService: getIt(),
      ));
  getIt.registerLazySingleton<ForgetRemoteDataSource>(
          () => ForgetRemoteDataSourceImpl(auth: getIt()));
  getIt.registerLazySingleton<ChatRemoteDataSource>(
        () => ChatRemoteDataSourceImpl(getIt(), getIt(), getIt()),
  );
}

void _setupRepositories()
{
  getIt.registerLazySingleton<ChatRepo>(() => ChatRepoImpl((getIt())));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl((getIt())));
  getIt.registerLazySingleton<LoginInRepo>(() => LoginRepoImpl(getIt()));
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepoImpl(getIt()));
  getIt.registerLazySingleton<ForgetRepo>(() => ForgetRepoImpl(getIt()));
  getIt.registerLazySingleton<VerifyEmailRepo>(
          () => VerifyEmailRepoImpl(getIt()));
}

void _setupUseCases()
{
  getIt.registerLazySingleton<GetAllUsersUseCase>(
          () => GetAllUsersUseCase(getIt()));
  getIt.registerLazySingleton<GetUserUseCase>(() => GetUserUseCase(getIt()));
  getIt.registerLazySingleton<UpdateUserUseCase>(
          () => UpdateUserUseCase(getIt()));
  getIt.registerLazySingleton<UpdateEmailAndPasswordUseCase>(
          () => UpdateEmailAndPasswordUseCase(getIt()));

  getIt.registerLazySingleton<CheckVerifyEmailUseCase>(
          () => CheckVerifyEmailUseCase(getIt()));
  getIt.registerLazySingleton<SignInUseCase>(() => SignInUseCase(getIt()));
  getIt.registerLazySingleton<UserUidUseCase>(() => UserUidUseCase(getIt()));
  getIt.registerLazySingleton<ForgetPasswordUseCase>(
          () => ForgetPasswordUseCase(getIt()));
  getIt.registerLazySingleton<HomeLogOutUseCase>(
          () => HomeLogOutUseCase(getIt()));
  getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(getIt()));
  getIt.registerLazySingleton<RegisterUploadImageUseCase>(
          () => RegisterUploadImageUseCase(getIt()));
  getIt.registerLazySingleton<UploadImageUseCase>(
          () => UploadImageUseCase(getIt()));
  getIt.registerLazySingleton<GoogleSignInUseCase>(
          () => GoogleSignInUseCase(getIt()));
  getIt.registerLazySingleton<GitHubSignInUseCase>(
          () => GitHubSignInUseCase(getIt()));
  getIt.registerLazySingleton<TwitterSignInUseCase>(
          () => TwitterSignInUseCase(getIt()));
  getIt.registerLazySingleton<CreateUserUseCase>(
          () => CreateUserUseCase(getIt()));
  getIt.registerLazySingleton<VerifyEmailUseCase>(
          () => VerifyEmailUseCase(getIt()));
  getIt.registerLazySingleton<LogOutUseCase>(() => LogOutUseCase(getIt()));
  getIt.registerLazySingleton<ResendVerifyEmailUseCase>(
          () => ResendVerifyEmailUseCase(getIt()));
  getIt.registerLazySingleton<SearchUsersUseCase>(
          () => SearchUsersUseCase(getIt()));
  getIt.registerLazySingleton<ChatsUploadImageUseCase>(
          () => ChatsUploadImageUseCase(getIt()));
  getIt.registerLazySingleton<AddImageMessageUseCase>(
          () => AddImageMessageUseCase(getIt()));
  getIt.registerLazySingleton<AddTextMessageUseCase>(
          () => AddTextMessageUseCase(getIt()));
  getIt.registerLazySingleton<GetAllMessagesUseCase>(
          () => GetAllMessagesUseCase(getIt()));
  getIt
      .registerLazySingleton<GetUserIdUseCase>(() => GetUserIdUseCase(getIt()));

}

void _setupCubits()
{
  getIt.registerLazySingleton<LoginCubit>(
        () => LoginCubit(
      twitterSignInUseCase: getIt(),
      googleSignInUseCase: getIt(),
      signInUseCase: getIt(),
      gitHubSignInUseCase: getIt(),
    ),
  );

  getIt.registerLazySingleton<SendMessagesCubit>(
        () => SendMessagesCubit(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );
  getIt.registerLazySingleton<GetAllMessagesCubit>(
        () => GetAllMessagesCubit(
      getIt(),
    ),
  );
  getIt.registerLazySingleton<UpdateUserCubit>(
        () => UpdateUserCubit(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );
  getIt.registerLazySingleton<GetAllUserCubit>(
        () => GetAllUserCubit(
      getIt(),
      getIt(),
    ),
  );
  getIt.registerLazySingleton<GetUserCubit>(
        () => GetUserCubit(
      getIt(),
      getIt(),
    ),
  );
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(
    registerUseCase: getIt(),
    uploadImageUseCase: getIt(),
    createUserUseCase: getIt(),
  ));
  getIt.registerLazySingleton<ForgetPasswordCubit>(
        () => ForgetPasswordCubit(
      getIt(),
    ),
  );

  getIt.registerLazySingleton<VerifyEmailCubit>(
        () => VerifyEmailCubit(
      checkVerifyEmail: getIt(),
      verifyEmail: getIt(),
      resendVerifyEmail: getIt(),
      logOut: getIt(),
    ),
  );

  getIt.registerLazySingleton<SearchUsersCubit>(
        () => SearchUsersCubit(
      getIt(),
    ),
  );

}

void _setupServices()
{
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
  getIt.registerLazySingleton<RemoteNotificationService>(
          () => RemoteNotificationService(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ));
  getIt.registerLazySingleton<LocalNotificationsServices>(
          () => LocalNotificationsServices(
        getIt(),
      ));
}

void _setupExternal()
{
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
  final fireStore = FirebaseFirestore.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final messaging = FirebaseMessaging.instance;
  getIt.registerLazySingleton(() => auth);
  getIt.registerLazySingleton(() => messaging);
  getIt.registerLazySingleton(() => flutterLocalNotificationsPlugin);
  getIt.registerLazySingleton(() => fireStore);
  getIt.registerLazySingleton(() => storage);
  getIt.registerLazySingleton(() => googleSignIn);
  getIt.registerLazySingleton(() => gitHubSignIn);
  getIt.registerLazySingleton(() => twitterLogin);
}
