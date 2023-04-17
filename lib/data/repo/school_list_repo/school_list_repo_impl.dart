import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class SchoolListRepoImpl implements SchoolListRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  SchoolListRepoImpl({
    required this.storage,
    required this.networkHelper,
  });

  @override
  Future<Either<SchoolListResponseModel, Failure>> getSchoolList() async {
    final response = await networkHelper.get(
      endPoints.getAllSchoolsEndPoint(),
    );
    return response.fold(
      (success) {
        return Left(
          schoolListResponseModelFromJson(success),
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
