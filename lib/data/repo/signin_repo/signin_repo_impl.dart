import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class SignInRepoImpl implements SignInRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  SignInRepoImpl({
    required this.storage,
    required this.networkHelper,
  });

  @override
  bool getBool(String key) {
    return storage.getBool(key: key) ?? false;
  }

  @override
  Future? setString(String key, dynamic value) {
    return storage.saveString(key: key, value: value);
  }

  @override
  String getString(String key) {
    return storage.getString(key: key) ?? '';
  }

  @override
  Future<Either<AuthenticationModel, Failure>> apiLogin({
    String email = '',
    String password = '',
    String fcm = '',
  }) async {
    String? savedEmail = storage.getString(key: StorageKeys.email);
    String? savedPassword = storage.getString(key: StorageKeys.password);
    String? savedFcm = storage.getString(key: StorageKeys.fcmToken);

    final body = {
      'email': savedEmail ?? email,
      'password': savedPassword ?? password,
      'fcm': savedFcm ?? fcm,
    };

    final response = await networkHelper.post(
      endPoints.getLoginEndPoint(),
      // headers:  {"Content-Type": "application/json"},
      body: body,
    );
    return response.fold(
      (success) {
        AuthenticationModel authenticationResponseModel =
            AuthenticationModel.fromJson(
          jsonDecode(success),
        );
        if (authenticationResponseModel.status == true) {
          storage.saveString(
            key: StorageKeys.firstName,
            value: authenticationResponseModel.parent.firstName,
          );
          storage.saveString(
            key: StorageKeys.lastName,
            value: authenticationResponseModel.parent.lastName,
          );
          storage.saveString(
            key: StorageKeys.accessToken,
            value: authenticationResponseModel.token,
          );
          storage.saveString(
            key: StorageKeys.email,
            value: savedEmail ?? email,
          );
          storage.saveString(
            key: StorageKeys.password,
            value: savedPassword ?? password,
          );
          storage.saveString(
            key: StorageKeys.fcmToken,
            value: savedFcm ?? fcm,
          );
          return Left(authenticationResponseModel);
        } else {
          return Right(
            Failure(
              message: authenticationResponseModel.message.toString(),
              status: authenticationResponseModel.status,
            ),
          );
        }
      },
      (error) {
        return Right(
          Failure(
            message: error.message,
            status: error.status,
          ),
        );
      },
    );
  }
}
