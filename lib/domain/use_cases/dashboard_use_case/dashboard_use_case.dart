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

  String? getFirstName() {
    return dashboardRepo.getString(
      key: StorageKeys.firstName,
    );
  }

  String? getLastName() {
    return dashboardRepo.getString(
      key: StorageKeys.lastName,
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
