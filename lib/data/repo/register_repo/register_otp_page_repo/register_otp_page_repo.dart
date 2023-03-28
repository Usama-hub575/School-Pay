import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/constants/export.dart';

mixin RegisterOTPPageRepo {
  Future<Either<OTPVerifyResModel, Failure>> verifyOTP({
    required String phoneNumber,
    required String otpCode,
  });
}
