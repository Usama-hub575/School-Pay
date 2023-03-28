import 'package:paynest_flutter_app/export.dart';
import 'package:paynest_flutter_app/presentation/bloc/dashboard_bloc/export.dart';

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

  it.registerLazySingleton(
    () => SignInBloc(
      signInUseCase: it<SignInUseCase>(),
    ),
  );

  it.registerLazySingleton(
    () => RegisterMainPageBloc(
      registerMainPageUseCase: it<RegisterMainPageUseCase>(),
    ),
  );

  it.registerLazySingleton(
    () => RegisterDetailPageBloc(
      registerDetailPageUseCase: it<RegisterDetailPageUseCase>(),
    ),
  );

  it.registerLazySingleton(
    () => RegisterOTPPageBloc(
      registerOTPPageUseCase: it<RegisterOTPPageUseCase>(),
    ),
  );

  it.registerLazySingleton(
    () => RegisterPageViewBloc(),
  );

  it.registerLazySingleton(
    () => DashboardBloc(
      dashboardUseCase: it<DashboardUseCase>(),
    ),
  );
}
