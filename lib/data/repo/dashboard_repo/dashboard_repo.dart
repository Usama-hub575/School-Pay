import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/constants/export.dart';

mixin DashboardRepo {
  int? getInt({required String key});

  String? getString({required String key});

  Future<Either<MyStudentsResponseModel, Failure>> getStudents({
    int? userID = 0,
  });

  Future<Either<TransactionListResponseModel, Failure>> getTransactions({
    int? userID = 0,
  });
}
