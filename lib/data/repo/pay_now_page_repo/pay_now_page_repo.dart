import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

mixin PayNowPageRepo {
  Future<Either<CreateTransactionResponseModel, Failure>> createTransaction({
    required String schoolID,
    required String parentID,
    required String studentID,
    required String amount,
    required String orderID,
  });
}
