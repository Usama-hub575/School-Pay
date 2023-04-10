import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class ChangePasswordRepoImpl implements ChangePasswordRepo {
  ChangePasswordRepoImpl({
    required this.storage,
    required this.networkHelper,
  });

  StorageRepo storage;
  NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  @override
  Future<Either<ChangePasswordResponseModel, Failure>> changePassword({
    String? oldPassword,
    String? newPassword,
  }) async {
    int? parentID = storage.getInt(
      key: StorageKeys.userId,
    );
    final response = await networkHelper.post(
      endPoints.getResetPasswordEndPoint(),
      modifyHeader: false,
      headers: {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer ${storage.getString(key: StorageKeys.accessToken) ?? ''}",
      },
      body: {
        'parentId': parentID,
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      },
    );
    return response.fold(
      (success) {
        return Left(
          changePasswordResponseModelFromJson(success),
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

  @override
  Future? setString({required key, required String? value}) {
    return storage.saveString(key: key, value: value);
  }
}
