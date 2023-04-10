import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/constants/export.dart';

class DashboardUseCase {
  DashboardUseCase({
    required this.dashboardRepo,
  });

  DashboardRepo dashboardRepo;

  int? getUserID() {
    return dashboardRepo.getInt(key: StorageKeys.userId)!;
  }

  bool? getBool() {
    return dashboardRepo.getBool(key: StorageKeys.isBioMetric);
  }

  Future? setBool({required key, bool? value}) {
    return dashboardRepo.setBool(key: key, value: value);
  }

  String? getString({required String key}) {
    return dashboardRepo.getString(
      key: key,
    );
  }

  Future<Either<MyStudentsResponseModel, Failure>> fetchStudents() async {
    final response = await dashboardRepo.getStudents(
      userID: getUserID(),
    );
    return response.fold(
      (success) {
        return Left(success);
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

  Future<Either<TransactionListResponseModel, Failure>>
      fetchTransactions() async {
    final response = await dashboardRepo.getTransactions(
      userID: getUserID(),
    );
    return response.fold(
      (success) {
        return Left(success);
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
