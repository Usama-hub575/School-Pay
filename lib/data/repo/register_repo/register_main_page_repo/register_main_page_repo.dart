import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

mixin RegisterMainPageRepo {
  Future<Either<OtpResponseModel, Failure>> apiSendOTP({
    required String email,
    required String phone,
    required String dialCode,
  });
}
