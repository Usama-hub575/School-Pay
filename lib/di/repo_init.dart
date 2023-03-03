import '../data/export.dart';
import 'export.dart';

late StorageRepo storage;

Future initializeRepoDependencies() async {
  MySharedPreferences sharedPreferences = MySharedPreferences.instance;

  it.registerLazySingleton<FirebaseRepo>(
    () => FirebaseRepoImpl(),
  );

  it.registerLazySingleton<InitializerRepo>(
    () => InitializerRepoImpl(
      storage: storage,
      networkHelper: it(),
    ),
  );
}
