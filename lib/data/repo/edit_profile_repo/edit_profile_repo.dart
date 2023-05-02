import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

mixin EditProfileRepo {
  String? getString({required String key});

  Future<Either<UpdateProfileResponseModel, Failure>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String expiryDate,
    required String emiratesID,
  });
}
