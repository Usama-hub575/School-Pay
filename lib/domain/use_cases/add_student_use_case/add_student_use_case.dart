import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class AddStudentUseCase {
  final AddStudentRepo addStudentRepo;

  AddStudentUseCase({
    required this.addStudentRepo,
  });

  Future<Either<AddStudentResponseModel, Failure>> addStudentByFirstName({
    required String parentID,
    required String dob,
    required String studentID,
    required String studentRegNo,
  }) async {
    final response = await addStudentRepo.addStudentByFirstName(
      parentID: parentID,
      dob: dob,
      studentID: studentID,
      studentRegNo: studentRegNo,
    );
    return response.fold(
      (success) {
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

  Future<Either<AddStudentResponseModel, Failure>> addStudentByParentID({
    required String parentID,
    required String studentID,
  }) async {
    final response = await addStudentRepo.addStudentByParentID(
      parentID: parentID,
      studentID: studentID,
    );
    return response.fold(
      (success) {
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

  Future<Either<AddStudentResponseModel, Failure>> addStudentByStudentID({
    required String studentID,
    required String studentRegNo,
  }) async {
    final response = await addStudentRepo.addStudentByStudentID(
      studentID: studentID,
      studentRegNo: studentRegNo,
    );
    return response.fold(
      (success) {
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

  Future<Either<AddStudentResponseModel, Failure>> addStudentByPayNestNumber({
    required String payNestNumber,
  }) async {
    final response = await addStudentRepo.addStudentByPayNestNumber(
      payNestNumber: payNestNumber,
    );
    return response.fold(
      (success) {
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

  Future<Either<StudentListResponseModel, Failure>> search({
    required String searchBy,
    required String queryParam,
    required int schoolID,
  }) async {
    final response = await addStudentRepo.search(
      searchBy: searchBy,
      queryParam: queryParam,
      schoolID: schoolID,
    );
    return response.fold(
      (success) {
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
