import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class PayNowPageUseCase {
  final PayNowPageRepo payNowPageRepo;

  PayNowPageUseCase({
    required this.payNowPageRepo,
  });

  Future<Either<CreateTransactionResponseModel, Failure>> createTransaction({
    required String schoolID,
    required String parentID,
    required String studentID,
    required String amount,
    required String orderID,
  }) async {
    final response = await payNowPageRepo.createTransaction(
      schoolID: schoolID,
      parentID: parentID,
      studentID: studentID,
      amount: amount,
      orderID: orderID,
    );
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
