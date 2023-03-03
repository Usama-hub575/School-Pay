import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/core/generic_response/failure.dart';
import 'package:paynest_flutter_app/core/generic_response/success.dart';
import 'package:paynest_flutter_app/data/model/response/auth/auth_model.dart';
import 'package:paynest_flutter_app/data/model/response/countries/get_countries/get_countries_response.dart';
import 'package:paynest_flutter_app/data/repo/initializer_repo/initializer_repo.dart';

class InitializerUseCase {
  InitializerUseCase({
    // required this.signInRepo,
    required this.initializerRepo,
  });

  InitializerRepo initializerRepo;
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
            message: error.message,
            status: false,
          ),
        );
      },
    );
  }

  // Future<Either<AuthenticationModel, Failure>> login({
  //   String email = '',
  //   String password = '',
  //   String fcmToken = '',
  // }) async {
  //   final response = await signInRepo.apiLogin();
  //   return response.fold(
  //         (responseModel) {
  //       _authResponseModel = responseModel;
  //       return Left(
  //         responseModel,
  //       );
  //     },
  //         (error) {
  //       return Right(
  //         Failure(
  //           message: error.message,
  //         ),
  //       );
  //     },
  //   );
  // }

  CountriesResponse getCountriesModel() => _countriesModel;

  AuthenticationModel getAuthenticationModel() => _authResponseModel;
}
