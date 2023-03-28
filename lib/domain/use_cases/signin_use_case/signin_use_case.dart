import 'package:paynest_flutter_app/export.dart';

class SignInUseCase {
  SignInUseCase({
    required this.signInRepo,
  });

  SignInRepo signInRepo;
  AuthenticationModel authenticationResponseData = AuthenticationModel.empty();
  late InitializerUseCase initializeUseCase;

  bool? isBioMetricEnable() {
    return signInRepo.getBool(StorageKeys.isBioMetric);
  }

  Future<AuthenticationModel> onPressed({
    String email = '',
    String password = '',
  }) async {
    final response = await signInRepo.apiLogin(
      email: email,
      password: password,
      fcm: signInRepo.getString('fcmToken'),
    );
    response.fold(
      (result) {
        authenticationResponseData = result;
      },
      (r) {
        authenticationResponseData.message = r.message;
      },
    );
    return authenticationResponseData;
  }

  Future<String?> bioMetricOnTap() async {
    bool isAuthenticated = await LocalAuthApi.authenticateWithBiometrics();
    if (isAuthenticated) {
      String? email = signInRepo.getString(
        StorageKeys.userEmail,
      );
      String? password = signInRepo.getString(
        StorageKeys.userPassword,
      );
      await initializeUseCase.login(
        email: email,
        password: password,
        fcmToken: signInRepo.getString('fcmToken'),
      );

      if (authenticationResponseData.status) {
        signInRepo.setString(
          StorageKeys.accessToken,
          authenticationResponseData.token,
        );
        signInRepo.setString(
          StorageKeys.userEmail,
          authenticationResponseData.parent.email,
        );
        return home;
      } else if (authenticationResponseData.status ||
          !authenticationResponseData.status) {
        return authenticationResponseData.message;
      }
    }
    return '';
  }
}
