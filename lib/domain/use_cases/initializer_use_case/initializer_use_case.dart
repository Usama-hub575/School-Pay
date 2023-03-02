import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/core/export.dart';
import 'package:paynest_flutter_app/data/export.dart';

class InitializerUseCase {
  InitializerUseCase({
    // required this.signInRepo,
    required this.firebaseRepo,
    required this.initializerRepo,
  });

  InitializerRepo initializerRepo;
  FirebaseRepo firebaseRepo;
  // SignInRepo signInRepo;

  CountriesResponse _countriesModel = CountriesResponse.empty();
  AuthenticationModel _authResponseModel = AuthenticationModel.empty();

  Future<Either<Success, Failure>> getCountries() async {
    final response = await initializerRepo.getCountries();
    return response.fold(
      (success) {
        _countriesModel = success;
        return Left(
          Success(),
        );
      },
      (error) {
        return Right(
          Failure(
            status: false,
            message: error.message,
          ),
        );
      },
    );
  }

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

  // Future<Either<AuthenticationModel, Failure>> login({
  //   String email = '',
  //   String password = '',
  //   String fcmToken = '',
  // }) async {
  // final response = await signInRepo.apiLogin();
  // return response.fold(
  //       (responseModel) {
  //     _authResponseModel = responseModel;
  //     return Left(
  //       responseModel,
  //     );
  //   },
  //       (error) {
  //     return Right(
  //       Failure(
  //         message: error.message,
  //       ),
  //     );
  //   },
  // );
  // }

  CountriesResponse getCountriesModel() => _countriesModel;

  AuthenticationModel getAuthenticationModel() => _authResponseModel;
}
