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
  Future? saveString({required String key, String? value}) {
    return storage.saveString(key: key, value: value);
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
    final response = await networkHelper.put(
        endPoints.getUpdateProfileEndPoint(),
        //         headers: {
        //   "Content-Type": "application/json",
        //   "Authorization":
        //       "Bearer ${storage.getString(key: StorageKeys.accessToken) ?? ''}",
        // },
        body: {
          "id": parentID,
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "expiryDate": expiryDate,
          "emiratesId": emiratesId
        });
    return response.fold(
      (success) {
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
