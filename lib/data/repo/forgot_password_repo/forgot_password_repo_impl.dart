import 'package:dartz/dartz.dart';
import 'package:paynest_flutter_app/export.dart';

class ForgotPasswordRepoImpl implements ForgotPasswordRepo {
  StorageRepo storage;
  NetworkHelper networkHelper;
  EndPoints endPoints = EndPoints();

  ForgotPasswordRepoImpl({
    required this.storage,
    required this.networkHelper,
  });

  @override
  Future<Either<ForgotPasswordResponseModel, Failure>> forgotPassword(
      {required String email}) async {
    final response = await networkHelper.post(
      endPoints.getForgotPasswordEndPoint(),
      headers: endPoints.headers,
      body: {
        'email': email,
      },
    );
    return response.fold(
      (success) {
        return Left(
          forgotPasswordResponseModelFromJson(success),
        );
      },
      (r) {
        return Right(
          Failure(status: r.status, message: r.message),
        );
      },
    );
  }
}
