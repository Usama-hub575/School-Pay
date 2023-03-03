import 'package:paynest_flutter_app/data/model/firebase/firebase_remote_config_model.dart';
import 'package:paynest_flutter_app/data/network/network_endpoints.dart';
import 'package:paynest_flutter_app/data/repo/firebase_repo/firebase_repo.dart';

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
