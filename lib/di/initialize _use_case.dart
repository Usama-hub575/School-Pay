import 'package:paynest_flutter_app/export.dart';

Future initializeUseCaseDependencies() async {
  await initializeFirebaseUseCase();
  await initializeLocaleUseCase();
  await initializeInitializerUseCase();
  await initializeSignInUseCase();
  await initializeRegisterDetailPageUseCase();
  await initializeRegisterMainPageUseCase();
  await initializerRegisterOTPPageUseCase();
  await initializeDashboardUseCase();
}

Future initializeLocaleUseCase() async {
  it.registerLazySingleton<LocaleUseCase>(
    () => LocaleUseCase(),
  );
}

Future initializeInitializerUseCase() async {
  it.registerLazySingleton<InitializerUseCase>(
    () => InitializerUseCase(
      initializerRepo: it<InitializerRepo>(),
      signInRepo: it<SignInRepo>(),
    ),
  );
}

Future initializeFirebaseUseCase() async {
  it.registerLazySingleton<FirebaseUseCase>(
    () => FirebaseUseCase(
      firebaseRepo: it<FirebaseRepo>(),
    ),
  );
}

Future initializeSignInUseCase() async {
  it.registerLazySingleton(
    () => SignInUseCase(
      signInRepo: it<SignInRepo>(),
    ),
  );
}

Future initializeRegisterMainPageUseCase() async {
  it.registerLazySingleton(
    () => RegisterMainPageUseCase(
      registerMainPageRepo: it<RegisterMainPageRepo>(),
    ),
  );
}

Future initializeRegisterDetailPageUseCase() async {
  it.registerLazySingleton(
    () => RegisterDetailPageUseCase(
      registerDetailPageRepo: it<RegisterDetailPageRepo>(),
    ),
  );
}

Future initializerRegisterOTPPageUseCase() async {
  it.registerLazySingleton(
    () => RegisterOTPPageUseCase(
      registerOTPPageRepo: it<RegisterOTPPageRepo>(),
    ),
  );
}

Future initializeDashboardUseCase() async {
  it.registerLazySingleton(
    () => DashboardUseCase(
      dashboardRepo: it<DashboardRepo>(),
    ),
  );
}
