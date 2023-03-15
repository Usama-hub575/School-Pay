import 'package:paynest_flutter_app/export.dart';

Future initializeUseCaseDependencies() async {
  await initializeFirebaseUseCase();
  await initializeLocaleUseCase();
  await initializeInitializerUseCase();
  await initializeSignInUseCase();
  await initializeRegisterDetailPageUseCase();
  await initializeRegisterMainPageUseCase();
  await initializerRegisterOTPPageUseCase();
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
      registerDetailPageUseCase: it<RegisterDetailPageRepo>(),
    ),
  );
}

Future initializerRegisterOTPPageUseCase() async {
  it.registerLazySingleton(
    () => RegisterOTPPageUseCase(
        // registerOTPPageRep: it<RegisterOTPPageRepo>(),
        ),
  );
}
