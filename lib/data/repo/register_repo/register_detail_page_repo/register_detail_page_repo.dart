import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

mixin RegisterDetailPageRepo {
  Future<Either<RegisterResponseModel, Failure>> register({
    required String firstName,
    required String lastName,
    required String password,
    required String email,
    required String countryCode,
    required String dialCode,
    required String phone,
    required String emiratesId,
    required String gender,
    required String birth,
    required String passport,
  });

  Future? setInt({required String key, int? value});

  Future? setString({required String key, String? value});
}
