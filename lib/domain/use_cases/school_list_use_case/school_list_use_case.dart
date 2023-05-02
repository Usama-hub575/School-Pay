import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class SchoolListUseCase {
  final SchoolListRepo schoolListRepo;

  SchoolListUseCase({
    required this.schoolListRepo,
  });

  Future<Either<SchoolListResponseModel, Failure>> getSchoolList() async {
    final response = await schoolListRepo.getSchoolList();
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
