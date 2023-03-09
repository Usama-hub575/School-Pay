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
}
