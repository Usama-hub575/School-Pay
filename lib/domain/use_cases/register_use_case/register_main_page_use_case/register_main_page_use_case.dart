import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class RegisterMainPageUseCase {
  RegisterMainPageUseCase({
    required this.registerMainPageRepo,
  });

  RegisterMainPageRepo registerMainPageRepo;
  OtpResponseModel otpResponseModel = OtpResponseModel(
    requestId: null,
    type: null,
  );

  Future<Either<Success, Failure>> hitSendOTP(
    email,
    userPhone,
    dialCode,
  ) async {
    try {
      final response = await registerMainPageRepo.apiSendOTP(
        dialCode: dialCode,
        email: email,
        phone: phone,
      );

      return response.fold(
        (success) {
          otpResponseModel = success;
          return Left(
            Success(),
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

  OtpResponseModel getOTPModel() => otpResponseModel;
}
