import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class EditProfileRepoImpl implements EditProfileRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  EditProfileRepoImpl({
    required this.storage,
    required this.networkHelper,
  });

  @override
  String? getString({required String key}) {
    return storage.getString(key: key);
  }

  @override
  Future<Either<UpdateProfileResponseModel, Failure>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String expiryDate,
    required String emiratesID,
  }) async {
    int? parentID = storage.getInt(
      key: StorageKeys.userId,
    );
    final response =
        await networkHelper.put(endPoints.getUpdateProfileEndPoint(), body: {
      "id": parentID,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "expiryDate": expiryDate,
      "emiratesId": emiratesId
    });
    return response.fold(
      (success) {
        storage.saveString(
          key: StorageKeys.firstName,
          value: firstName,
        );
        storage.saveString(
          key: StorageKeys.lastName,
          value: lastName,
        );
        return Left(
          updateProfileResponseModelFromJson(success),
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
