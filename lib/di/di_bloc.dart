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

  it.registerLazySingleton(
    () => HostBloc(),
  );

  it.registerLazySingleton(
    () => GetAssistanceBloc(),
  );
  it.registerLazySingleton(
    () => ForgotPasswordBloc(
      forgotPasswordUseCase: it<ForgotPasswordUseCase>(),
    ),
  );
  it.registerLazySingleton(
    () => ResetPasswordBloc(
      resetPasswordUseCase: it<ResetPasswordUseCase>(),
    ),
  );

  it.registerLazySingleton(
    () => ChangePasswordBloc(
      changePasswordUseCase: it<ChangePasswordUseCase>(),
    ),
  );
  it.registerLazySingleton(
    () => EditProfileBloc(
      editProfileUseCase: it<EditProfileUseCase>(),
    ),
  );
  it.registerLazySingleton(
    () => SchoolListBloc(
      schoolListUseCase: it<SchoolListUseCase>(),
    ),
  );
  it.registerLazySingleton(
    () => PayNowBloc(
      payNowPageUseCase: it<PayNowPageUseCase>(),
    ),
  );
  it.registerLazySingleton(
    () => AddStudentBloc(
      addStudentUseCase: it<AddStudentUseCase>(),
    ),
  );
}
