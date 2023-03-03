import 'package:paynest_flutter_app/domain/use_cases/firebase_use_case/firebase_use_case.dart';
import 'package:paynest_flutter_app/presentation/bloc/firebase_bloc/firebase_bloc.dart';

import '../presentation/bloc/export.dart';
import 'export.dart';

Future initializeBlocs() async {
  it.registerLazySingleton(
    () => InitializerBloc(
      firebaseUseCase: it<FirebaseUseCase>(),
      initializerUseCase: it<InitializerUseCase>(),
    ),
  );

  it.registerLazySingleton(
    () => FirebaseBloc(
      firebaseUseCase: it<FirebaseUseCase>(),
    ),
  );
}
