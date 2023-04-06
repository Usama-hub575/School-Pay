import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class ResetPasswordUseCase {
  final ResetPasswordRepo resetPasswordRepo;

  ResetPasswordUseCase({
    required this.resetPasswordRepo,
  });

  Future<Either<ForgotPasswordResponseModel, Failure>> resetPassword({
    required String email,
    required String otp,
    required String password,
  }) async {
    final response = await resetPasswordRepo.resetPassword(
      email: email,
      otp: otp,
      password: password,
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
  }
}
