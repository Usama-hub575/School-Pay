import 'package:paynest_flutter_app/export.dart';

Future initializeUseCaseDependencies() async {
  await initializeFirebaseUseCase();
  await initializeLocaleUseCase();
  await initializeInitializerUseCase();
}

Future initializeLocaleUseCase() async {
  it.registerLazySingleton<LocaleUseCase>(
    () => LocaleUseCase(),
  );
}

Future initializeInitializerUseCase() async {
  it.registerLazySingleton<InitializerUseCase>(
    () => InitializerUseCase(
      //firebaseRepo: it<FirebaseRepo>(),
      initializerRepo: it<InitializerRepo>(),
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
