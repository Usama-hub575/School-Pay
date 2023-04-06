import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/constants/export.dart';

class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final StorageRepo storageRepo;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  ResetPasswordRepoImpl({
    required this.storageRepo,
    required this.networkHelper,
  });

  @override
  Future<Either<ForgotPasswordResponseModel, Failure>> resetPassword({
    required String email,
    required String otp,
    required String password,
  }) async {
    final response = await networkHelper.post(
      endPoints.getResetPasswordByOTPEndPoint(),
      body: {
        'email': email,
        'otpValue': otp,
        'password': password,
      },
    );
    return response.fold(
      (success) {
        return Left(
          forgotPasswordResponseModelFromJson(success),
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
