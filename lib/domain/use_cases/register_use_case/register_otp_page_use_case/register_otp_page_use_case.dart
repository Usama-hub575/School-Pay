import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class RegisterOTPPageUseCase {
  RegisterOTPPageUseCase({
    required this.registerOTPPageRepo,
  });

  RegisterOTPPageRepo registerOTPPageRepo;

  Future<Either<OTPVerifyResModel, Failure>> verifyOTP(
    phoneNumber,
    otpCode,
  ) async {
    try {
      final response = await registerOTPPageRepo.verifyOTP(
        phoneNumber: phoneNumber,
        otpCode: otpCode,
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
