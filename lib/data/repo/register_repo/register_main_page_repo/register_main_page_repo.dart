import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

mixin RegisterMainPageRepo {
  Future<Either<OTPResponseModel, Failure>> sendOTP({
    required String email,
    required String phone,
    required String dialCode,
  });
}
