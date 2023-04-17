import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class PayNowPageRepoImpl implements PayNowPageRepo {
  final StorageRepo storage;
  final NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  PayNowPageRepoImpl({
    required this.storage,
    required this.networkHelper,
  });

  @override
  Future<Either<CreateTransactionResponseModel, Failure>> createTransaction({
    required String schoolID,
    required String parentID,
    required String studentID,
    required String amount,
    required String orderID,
  }) async {
    final response = await networkHelper.post(
      endPoints.getCreateTransactionEndPoint(),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${storage.getString(
          key: StorageKeys.accessToken,
        )}",
      },
    );
    return response.fold(
      (success) {
        return Left(
          createTransactionResponseModelFromJson(success),
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
