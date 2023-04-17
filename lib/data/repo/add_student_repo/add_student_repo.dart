import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

mixin AddStudentRepo {
  Future<Either<AddStudentResponseModel, Failure>> addStudentByFirstName({
    required String parentID,
    required String dob,
    required String studentID,
    required String studentRegNo,
  });

  Future<Either<AddStudentResponseModel, Failure>> addStudentByParentID({
    required String parentID,
    required String studentID,
  });

  Future<Either<AddStudentResponseModel, Failure>> addStudentByStudentID({
    required String studentID,
    required String studentRegNo,
  });

  Future<Either<AddStudentResponseModel, Failure>> addStudentByPayNestNumber({
    required String payNestNumber,
  });
}
