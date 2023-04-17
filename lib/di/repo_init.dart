import 'package:paynest_flutter_app/export.dart';

late StorageRepo storage;

Future initializeRepoDependencies() async {
  storage = StorageRepoImpl(
    sharedPreferences: await SharedPreferences.getInstance(),
  );
  it.registerLazySingleton<FirebaseRepo>(
    () => FirebaseRepoImpl(),
  );

  it.registerLazySingleton<InitializerRepo>(
    () => InitializerRepoImpl(
      storage: storage,
      networkHelper: it(),
    ),
  );

  it.registerLazySingleton<SignInRepo>(
    () => SignInRepoImpl(
      storage: storage,
      networkHelper: it(),
    ),
  );

  it.registerLazySingleton<RegisterMainPageRepo>(
    () => RegisterMainPageRepoImpl(
      storage: storage,
      networkHelper: it(),
    ),
  );

  it.registerLazySingleton<RegisterDetailPageRepo>(
    () => RegisterDetailPageRepoImpl(
      networkHelper: it(),
      storage: storage,
    ),
  );

  it.registerLazySingleton<RegisterOTPPageRepo>(
    () => RegisterOTPPageRepoImpl(
      storage: storage,
      networkHelper: it(),
    ),
  );

  it.registerLazySingleton<DashboardRepo>(
    () => DashboardRepoImpl(
      storage: storage,
      networkHelper: it(),
    ),
  );

  it.registerLazySingleton<ForgotPasswordRepo>(
    () => ForgotPasswordRepoImpl(
      storage: storage,
      networkHelper: it(),
    ),
  );

  it.registerLazySingleton<ResetPasswordRepo>(
    () => ResetPasswordRepoImpl(
      storageRepo: storage,
      networkHelper: it(),
    ),
  );
  it.registerLazySingleton<ChangePasswordRepo>(
    () => ChangePasswordRepoImpl(
      storage: storage,
      networkHelper: it(),
    ),
  );
  it.registerLazySingleton<EditProfileRepo>(
    () => EditProfileRepoImpl(
      storage: storage,
      networkHelper: it(),
    ),
  );
  it.registerLazySingleton<SchoolListRepo>(
    () => SchoolListRepoImpl(
      storage: storage,
      networkHelper: it(),
    ),
  );
  it.registerLazySingleton<PayNowPageRepo>(
    () => PayNowPageRepoImpl(
      storage: storage,
      networkHelper: it(),
    ),
  );
}
