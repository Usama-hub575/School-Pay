import 'package:paynest_flutter_app/export.dart';

class FirebaseUseCase {
  FirebaseUseCase({
    required this.firebaseRepo,
  });

  FirebaseRepo firebaseRepo;

  FirebaseRemoteConfigModel _remoteConfigModel =
      FirebaseRemoteConfigModel.defaults();

  Future<bool> initializeRemoteConfig() async {
    final response = await firebaseRepo.initializeRemoteConfig();
    return response.fold(
      (success) {
        _remoteConfigModel = success;
        EndPoints().baseUrl = Uri.parse(success.baseUrl);
        EndPoints().paymentGatewayUrl = Uri.parse(success.paymentGateway);
        return true;
      },
      (error) {
        return false;
      },
    );
  }

  FirebaseRemoteConfigModel getModel() => _remoteConfigModel;
}
