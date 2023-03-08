import 'package:paynest_flutter_app/export.dart';

Future initializeBlocs() async {
  it.registerLazySingleton(
    () => FirebaseBloc(
      firebaseUseCase: it<FirebaseUseCase>(),
    ),
  );

  it.registerLazySingleton(
    () => InitializerBloc(
      firebaseUseCase: it<FirebaseUseCase>(),
      initializerUseCase: it<InitializerUseCase>(),
    ),
  );
}
