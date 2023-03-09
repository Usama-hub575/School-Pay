import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class FirebaseRepoImpl implements FirebaseRepo {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  Future<dynamic> _getLocalPackageInfo() async {
    return await PackageInfo.fromPlatform();
  }

  @override
  Future<Either<FirebaseRemoteConfigModel, Failure>>
      initializeRemoteConfig() async {
    var packageInfo = await _getLocalPackageInfo();
    await remoteConfig.ensureInitialized();
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(
          minutes: 1,
        ),
        minimumFetchInterval: const Duration(
          seconds: 30,
        ),
      ),
    );

    final response = await _fetchAndActivate();
    return response.fold(
      (value) {
        FirebaseRemoteConfigModel configModel =
            FirebaseRemoteConfigModel.defaults();
        configModel.baseUrl = remoteConfig.getString(AppConstants().baseUrl);
        configModel.appPackage = (packageInfo as PackageInfo).packageName;
        configModel.currentVersion = (packageInfo).version;
        configModel.paymentGateway =
            remoteConfig.getString(AppConstants().paymentGatewayUrl);
        configModel.minAndroidVersion =
            remoteConfig.getString(AppConstants().minAndroidAppVersion);
        configModel.maxAndroidVersion =
            remoteConfig.getString(AppConstants().maxAndroidAppVersion);
        configModel.minIosVersion =
            remoteConfig.getString(AppConstants().minIosAppVersion);
        configModel.maxIosVersion =
            remoteConfig.getString(AppConstants().maxIosAppVersion);
        if (configModel != FirebaseRemoteConfigModel.defaults()) {
          return Left(configModel);
        } else {
          return Right(
            Failure(
              status: false,
              message: 'Value Not Found',
            ),
          );
        }
      },
      (error) {
        return Right(Failure(
          message: error.message,
          status: false,
        ));
      },
    );
  }

  Future<Either<bool, Failure>> _fetchAndActivate() async {
    try {
      await remoteConfig.fetchAndActivate();
      return const Left(true);
    } catch (error) {
      return Right(
        Failure(
          status: false,
          message: error.toString(),
        ),
      );
    }
  }
}
