import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

mixin EditProfileRepo {
  Future<Either<UpdateProfileResponseModel, Failure>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String expiryDate,
    required String emiratesID,
  });
}
