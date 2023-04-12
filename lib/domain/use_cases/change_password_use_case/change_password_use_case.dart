import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class ChangePasswordUseCase {
  ChangePasswordUseCase({
    required this.changePasswordRepo,
  });

  ChangePasswordRepo changePasswordRepo;

  Future? setString({required key, required String value}) {
    return changePasswordRepo.setString(key: key, value: value);
  }

  Future<Either<ChangePasswordResponseModel, Failure>> changePassword({
    required String? oldPassword,
    required String? newPassword,
  }) async {
    final response = await changePasswordRepo.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
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
