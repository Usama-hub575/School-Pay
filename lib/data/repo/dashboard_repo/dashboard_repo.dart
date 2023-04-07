import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/constants/export.dart';

mixin DashboardRepo {
  int? getInt({required String key});

  bool? getBool({required String key});

  Future? setBool({required String key, bool? value});

  String? getString({required String key});

  Future<Either<MyStudentsResponseModel, Failure>> getStudents({
    int? userID = 0,
  });

  Future<Either<TransactionListResponseModel, Failure>> getTransactions({
    int? userID = 0,
  });
}
