import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/constants/export.dart';

mixin ForgotPasswordRepo {
  Future<Either<ForgotPasswordResponseModel, Failure>> forgotPassword({
    required String email,
  });
}
