import 'package:paynest_flutter_app/export.dart';

Future initializeUseCaseDependencies() async {
  await initializeFirebaseUseCase();
  await initializeLocaleUseCase();
  await initializeInitializerUseCase();
  await initializeSignInUseCase();
  await initializeRegisterDetailPageUseCase();
  await initializeRegisterMainPageUseCase();
  await initializerRegisterOTPPageUseCase();
  await initializeDashboardUseCase();
  await initializeForgotPasswordUseCase();
  await initializeResetPasswordUseCase();
  await initializeChangePasswordUseCase();
  await initializeEditProfileUseCase();
}

Future initializeLocaleUseCase() async {
  it.registerLazySingleton<LocaleUseCase>(
    () => LocaleUseCase(),
  );
}

Future initializeInitializerUseCase() async {
  it.registerLazySingleton<InitializerUseCase>(
    () => InitializerUseCase(
      initializerRepo: it<InitializerRepo>(),
      signInRepo: it<SignInRepo>(),
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

Future initializeSignInUseCase() async {
  it.registerLazySingleton(
    () => SignInUseCase(
      signInRepo: it<SignInRepo>(),
    ),
  );
}

Future initializeRegisterMainPageUseCase() async {
  it.registerLazySingleton(
    () => RegisterMainPageUseCase(
      registerMainPageRepo: it<RegisterMainPageRepo>(),
    ),
  );
}

Future initializeRegisterDetailPageUseCase() async {
  it.registerLazySingleton(
    () => RegisterDetailPageUseCase(
      registerDetailPageRepo: it<RegisterDetailPageRepo>(),
    ),
  );
}

Future initializerRegisterOTPPageUseCase() async {
  it.registerLazySingleton(
    () => RegisterOTPPageUseCase(
      registerOTPPageRepo: it<RegisterOTPPageRepo>(),
    ),
  );
}

Future initializeDashboardUseCase() async {
  it.registerLazySingleton(
    () => DashboardUseCase(
      dashboardRepo: it<DashboardRepo>(),
    ),
  );
}

Future initializeForgotPasswordUseCase() async {
  it.registerLazySingleton(
    () => ForgotPasswordUseCase(
      forgotPasswordRepo: it<ForgotPasswordRepo>(),
    ),
  );
}

Future initializeResetPasswordUseCase() async {
  it.registerLazySingleton(
    () => ResetPasswordUseCase(
      resetPasswordRepo: it<ResetPasswordRepo>(),
    ),
  );
}

Future initializeChangePasswordUseCase() async {
  it.registerLazySingleton(
    () => ChangePasswordUseCase(
      changePasswordRepo: it<ChangePasswordRepo>(),
    ),
  );
}

Future initializeEditProfileUseCase() async {
  it.registerLazySingleton(
    () => EditProfileUseCase(
      editProfileRepo: it<EditProfileRepo>(),
    ),
  );
}
