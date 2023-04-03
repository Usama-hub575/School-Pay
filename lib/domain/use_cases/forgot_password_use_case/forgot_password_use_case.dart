import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class ForgotPasswordUseCase {
  ForgotPasswordRepo forgotPasswordRepo;

  ForgotPasswordUseCase({
    required this.forgotPasswordRepo,
  });

  Future<Either<ForgotPasswordResponseModel, Failure>> forgotPassword(
      String email) async {
    final response = await forgotPasswordRepo.forgotPassword(email: email);
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
