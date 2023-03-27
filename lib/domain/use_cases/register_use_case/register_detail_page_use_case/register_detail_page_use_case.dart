import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class RegisterDetailPageUseCase {
  RegisterDetailPageUseCase({
    required this.registerDetailPageRepo,
  });

  RegisterDetailPageRepo registerDetailPageRepo;

  Future<Either<RegisterRespModel, Failure>> register({
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
          return Left(
            success,
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
}
