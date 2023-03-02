

import '../Utils/sharedpref.dart';
import '../data/export.dart';
import 'di.dart';

Future initializeRepoDependencies() async {
  MySharedPreferences sharedPreferences = MySharedPreferences.instance;

  it.registerLazySingleton<FirebaseRepo>(
    () => FirebaseRepoImpl(),
  );
}
