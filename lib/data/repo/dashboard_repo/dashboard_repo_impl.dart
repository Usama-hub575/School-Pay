import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class DashboardRepoImpl implements DashboardRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  DashboardRepoImpl({
    required this.storage,
    required this.networkHelper,
  });

  @override
  int? getInt({required String key}) {
    return storage.getInt(key: key);
  }

  @override
  bool? getBool({required String key}) {
    if (storage.contains(key) ?? false) {
      return storage.getBool(key: key);
    }
    return false;
  }

  @override
  Future? setBool({required String key, bool? value}) {
    return storage.saveBool(key: key, value: value);
  }

  @override
  String? getString({required String key}) {
    return storage.getString(key: key);
  }

  @override
  Future<Either<MyStudentsResponseModel, Failure>> getStudents({
    int? userID = 0,
  }) async {
    final response = await networkHelper.post(
      endPoints.getMyStudentsEndPoint(),
      modifyHeader: false,
      headers: {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer ${storage.getString(key: StorageKeys.accessToken) ?? ''}",
      },
      body: {
        'parentId': userID,
      },
    );
    return response.fold(
      (success) {
        return Left(
          myStudentsResponseModelFromJson(success),
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
  Future<Either<TransactionListResponseModel, Failure>> getTransactions({
    int? userID = 0,
  }) async {
    final response = await networkHelper.post(
      endPoints.getTransactionEndPoint(),
      modifyHeader: false,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization":
            "Bearer ${storage.getString(key: StorageKeys.accessToken) ?? ''}",
      },
      body: {
        'parentId': userID,
      },
    );
    return response.fold(
      (success) {
        return Left(
          transactionListResponseModelFromJson(success),
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
