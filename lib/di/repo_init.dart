import 'package:paynest_flutter_app/export.dart';

late StorageRepo storage;

Future initializeRepoDependencies() async {
  // MySharedPreferences sharedPreferences = MySharedPreferences.instance;
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
}
