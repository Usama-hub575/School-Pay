import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class InitializerUseCase {
  InitializerUseCase({
    required this.signInRepo,
    required this.initializerRepo,
  });

  InitializerRepo initializerRepo;

  SignInRepo signInRepo;

  CountriesResponse _countriesModel = CountriesResponse.empty();
  AuthenticationModel _authResponseModel = AuthenticationModel.empty();

  String? getString({required String key}) {
    return initializerRepo.getString(key: key);
  }

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
            message: error.message,
            status: false,
          ),
        );
      },
    );
  }

  Future<Either<AuthenticationModel, Failure>> login({
    String email = '',
    String password = '',
    String fcmToken = '',
  }) async {
    final response = await signInRepo.apiLogin();
    return response.fold(
      (responseModel) {
        _authResponseModel = responseModel;
        return Left(
          responseModel,
        );
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

  CountriesResponse getCountriesModel() => _countriesModel;

  AuthenticationModel getAuthenticationModel() => _authResponseModel;
}
