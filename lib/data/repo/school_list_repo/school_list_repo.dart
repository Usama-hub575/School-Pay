import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

mixin SchoolListRepo {
  Future<Either<SchoolListResponseModel, Failure>> getSchoolList();
}
