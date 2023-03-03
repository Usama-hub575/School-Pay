import 'package:paynest_flutter_app/data/export.dart';
import 'package:paynest_flutter_app/domain/export.dart';
import 'package:paynest_flutter_app/domain/use_cases/firebase_use_case/firebase_use_case.dart';

import 'export.dart';

Future initializeUseCaseDependencies() async {
  await initializeLocaleUseCase();
  await initializeInitializerUseCase();
  await initializeFirebaseUseCase();
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
