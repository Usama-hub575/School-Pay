import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class EditProfileUseCase {
  EditProfileRepo editProfileRepo;

  EditProfileUseCase({
    required this.editProfileRepo,
  });

  Future<Either<UpdateProfileResponseModel, Failure>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String expiryDate,
    required String emiratesID,
  }) async {
    final response = await editProfileRepo.updateProfile(
      firstName: firstName,
      lastName: lastName,
      email: email,
      expiryDate: expiryDate,
      emiratesID: emiratesID,
    );
    return response.fold(
      (success) {
        editProfileRepo.saveString(
          key: StorageKeys.firstName,
          value: firstName,
        );
        editProfileRepo.saveString(
          key: StorageKeys.lastName,
          value: lastName,
        );
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
