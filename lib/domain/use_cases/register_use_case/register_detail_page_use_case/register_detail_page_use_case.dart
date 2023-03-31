import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class RegisterDetailPageUseCase {
  RegisterDetailPageUseCase({
    required this.registerDetailPageRepo,
  });

  RegisterDetailPageRepo registerDetailPageRepo;
  RegisterResponseModel _registerResponseModel = RegisterResponseModel.empty();

  Future<Either<RegisterResponseModel, Failure>> register({
    required firstName,
    required lastName,
    required password,
    required email,
    required countryCode,
    required dialCode,
    required phone,
    required emiratesId,
    required gender,
    required birth,
    required passport,
  }) async {
    try {
      final response = await registerDetailPageRepo.register(
        firstName: firstName,
        lastName: lastName,
        password: password,
        email: email,
        countryCode: countryCode,
        dialCode: dialCode,
        phone: phone,
        emiratesId: emiratesId,
        gender: gender,
        birth: birth,
        passport: passport,
      );

      return response.fold(
        (success) {
          if (success.status) {
            registerDetailPageRepo.setInt(
              key: StorageKeys.userId,
              value: success.parent!.id,
            );
            registerDetailPageRepo.setString(
              key: StorageKeys.firstName,
              value: success.parent!.firstName,
            );
            registerDetailPageRepo.setString(
              key: StorageKeys.lastName,
              value: success.parent!.lastName,
            );
          }
          return Left(
            _registerResponseModel = success,
          );
        },
        (r) {
          return Right(
            Failure(
              status: r.status,
              message: r.message,
            ),
          );
        },
      );
    } catch (e) {
      return Right(
        Failure(
          status: false,
          message: e.toString(),
        ),
      );
    }
  }

  RegisterResponseModel getRegisterResponseModel() => _registerResponseModel;
}
