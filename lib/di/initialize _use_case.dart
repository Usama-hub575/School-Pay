import 'package:paynest_flutter_app/data/export.dart';
import 'package:paynest_flutter_app/domain/export.dart';
import 'di.dart';

Future initializeUseCaseDependencies() async {
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
      firebaseRepo: it<FirebaseRepo>(),
    ),
  );
}
