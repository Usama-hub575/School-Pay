import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

mixin ChangePasswordRepo {
  Future<Either<ChangePasswordResponseModel, Failure>> changePassword({
    required String? oldPassword,
    required String? newPassword,
  });

  Future? setString({required key, required String? value});
}
