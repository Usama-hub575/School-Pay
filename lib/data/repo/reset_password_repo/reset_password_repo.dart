import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

mixin ResetPasswordRepo {
  Future<Either<ForgotPasswordResponseModel, Failure>> resetPassword({
    required String email,
    required String otp,
    required String password,
  });
}
