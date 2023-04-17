import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class AddStudentRepoImpl implements AddStudentRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  AddStudentRepoImpl({
    required this.storage,
    required this.networkHelper,
  });

  @override
  Future<Either<AddStudentResponseModel, Failure>> addStudentByFirstName({
    required String parentID,
    required String dob,
    required String studentID,
    required String studentRegNo,
  }) async {
    final response = await networkHelper
        .post(endPoints.getAddStudentByFirstNameEndPoint(), headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer ${storage.getString(
        key: StorageKeys.accessToken,
      )}",
    }, body: {
      "parentRegNo": parentId,
      "dob": dob,
      "studentId": studentID,
      "studentRegNo": studentRegNo,
    });
    return response.fold(
      (success) {
        return Left(
          addStudentResponseModelFromJson(success),
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
  Future<Either<AddStudentResponseModel, Failure>> addStudentByParentID({
    required String parentID,
    required String studentID,
  }) async {
    final response = await networkHelper.post(
        endPoints.getAddStudentByParentRegistrationNumberEndPoint(),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer ${storage.getString(
            key: StorageKeys.accessToken,
          )}",
        },
        body: {
          "parentRegNo": parentId,
          "studentId": studentID,
        });
    return response.fold(
      (success) {
        return Left(
          addStudentResponseModelFromJson(success),
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
  Future<Either<AddStudentResponseModel, Failure>> addStudentByStudentID({
    required String studentID,
    required String studentRegNo,
  }) async {
    final response = await networkHelper.post(
        endPoints.getAddStudentByStudentRegistrationNumberEndPoint(),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer ${storage.getString(
            key: StorageKeys.accessToken,
          )}",
        },
        body: {
          "studentRegNo": studentRegNo,
          "studentId": studentID,
        });
    return response.fold(
      (success) {
        return Left(
          addStudentResponseModelFromJson(success),
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
  Future<Either<AddStudentResponseModel, Failure>> addStudentByPayNestNumber({
    required String payNestNumber,
  }) async {
    final response = await networkHelper.post(
      endPoints.getAddStudentByPayNestNumberEndPoint(),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${storage.getString(
          key: StorageKeys.accessToken,
        )}",
      },
      body: {
        "paynestNumber": payNestNumber,
      },
    );
    return response.fold(
      (success) {
        return Left(
          addStudentResponseModelFromJson(success),
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
